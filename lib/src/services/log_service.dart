import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

enum LogLevel { debug, info, warning, error }

class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String? tag;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
    this.tag,
  });

  String get levelLabel {
    switch (level) {
      case LogLevel.debug:
        return 'D';
      case LogLevel.info:
        return 'I';
      case LogLevel.warning:
        return 'W';
      case LogLevel.error:
        return 'E';
    }
  }

  String format() {
    final time = '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}.'
        '${timestamp.millisecond.toString().padLeft(3, '0')}';
    final tagStr = tag != null ? '[$tag] ' : '';
    return '$time [$levelLabel] $tagStr$message';
  }
}

class LogService {
  static final LogService _instance = LogService._();
  static LogService get instance => _instance;

  LogService._();

  final List<LogEntry> _logs = [];
  static const int _maxLogs = 5000;
  static const int _maxMessageLength = 500;
  final _controller = StreamController<LogEntry>.broadcast();

  Stream<LogEntry> get logStream => _controller.stream;
  List<LogEntry> get logs => List.unmodifiable(_logs);

  bool _initialized = false;

  /// 初始化日志系统，拦截 print 输出
  void initialize() {
    if (_initialized) return;
    _initialized = true;
  }

  static const String _redacted = '<redacted>';

  // 日志可以在应用内复制、导出（常被附到 issue 里），所以写入前先去掉密码、
  // token、Cookie 等凭据。Dio 的 LogInterceptor 会逐行打印请求头和请求体，
  // 下载日志里的 URL 也带着 ?token=。
  static final List<(RegExp, String Function(Match))> _redactions = [
    // 请求头和响应头：Authorization: Bearer xxx、Cookie: a=b; c=d。同名响应头有多个值时
    // （如多条 Set-Cookie），LogInterceptor 用 \r\n\t 拼在同一条日志里，后面几行也要去掉。
    (
      RegExp(
        r'\b(authorization|proxy-authorization|cookie|set-cookie)(\s*[:=]\s*)[^\n]+(?:\n\t[^\n]*)*',
        caseSensitive: false,
      ),
      (m) => '${m[1]}${m[2]}$_redacted',
    ),
    // JSON：{"password":"xxx"}
    (
      RegExp(
        r'"(password|passwd|token|access_token|refresh_token|api_?key|secret)"(\s*:\s*)"(?:[^"\\]|\\.)*"',
        caseSensitive: false,
      ),
      (m) => '"${m[1]}"${m[2]}"$_redacted"',
    ),
    // Map.toString()：{name: foo, password: xxx}
    (
      RegExp(
        r'\b(password|passwd|token|access_token|refresh_token|api_?key|secret)(\s*:\s*)(?!exists\b|empty\b|null\b)[^,}\s][^,}\n]*',
        caseSensitive: false,
      ),
      (m) => '${m[1]}${m[2]}$_redacted',
    ),
    // URL 查询参数：?token=xxx&...
    (
      RegExp(
        r'([?&](?:token|access_token|api_?key)=)[^&#\s"\x27]+',
        caseSensitive: false,
      ),
      (m) => '${m[1]}$_redacted',
    ),
    // 其他地方出现的 Bearer token
    (
      RegExp(r'\b(Bearer\s+)[A-Za-z0-9\-_.~+/]+=*', caseSensitive: false),
      (m) => '${m[1]}$_redacted',
    ),
  ];

  /// 去掉 [message] 中的密码、token、Cookie 等凭据。
  static String redactSensitive(String message) {
    var result = message;
    for (final (pattern, replace) in _redactions) {
      result = result.replaceAllMapped(pattern, replace);
    }
    return result;
  }

  void _addEntry(LogEntry rawEntry) {
    final entry = LogEntry(
      timestamp: rawEntry.timestamp,
      level: rawEntry.level,
      message: redactSensitive(rawEntry.message),
      tag: rawEntry.tag,
    );
    // 截断过长的消息
    final truncated = entry.message.length > _maxMessageLength
        ? LogEntry(
            timestamp: entry.timestamp,
            level: entry.level,
            message:
                '${entry.message.substring(0, _maxMessageLength)}... (截断, 原长${entry.message.length})',
            tag: entry.tag,
          )
        : entry;
    _logs.add(truncated);
    if (_logs.length > _maxLogs) {
      _logs.removeRange(0, _logs.length - _maxLogs);
    }
    _controller.add(truncated);
  }

  void debug(String message, {String? tag}) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: LogLevel.debug,
      message: message,
      tag: tag,
    );
    _addEntry(entry);
  }

  void info(String message, {String? tag}) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: LogLevel.info,
      message: message,
      tag: tag,
    );
    _addEntry(entry);
  }

  void warning(String message, {String? tag}) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: LogLevel.warning,
      message: message,
      tag: tag,
    );
    _addEntry(entry);
  }

  void error(String message, {String? tag}) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: LogLevel.error,
      message: message,
      tag: tag,
    );
    _addEntry(entry);
  }

  /// 捕获 print 输出并记录
  void captureOutput(String line) {
    // 解析已有的标签格式如 [Audio], [FloatingLyric] 等
    String? tag;
    String message = line;
    final tagMatch = RegExp(r'^\[([^\]]+)\]\s*(.*)$').firstMatch(line);
    if (tagMatch != null) {
      tag = tagMatch.group(1);
      message = tagMatch.group(2) ?? line;
    }

    LogLevel level = LogLevel.debug;
    final lower = line.toLowerCase();
    if (lower.contains('error') ||
        lower.contains('exception') ||
        lower.contains('failed')) {
      level = LogLevel.error;
    } else if (lower.contains('warning') || lower.contains('warn')) {
      level = LogLevel.warning;
    }

    _addEntry(LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      tag: tag,
    ));
  }

  void clear() {
    _logs.clear();
  }

  String exportAsText() {
    final buffer = StringBuffer();
    buffer.writeln('=== KikoFlu Logs ===');
    buffer.writeln('Exported: ${DateTime.now().toIso8601String()}');
    buffer.writeln(
        'Platform: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}');
    buffer.writeln('Entries: ${_logs.length}');
    buffer.writeln('');
    for (final entry in _logs) {
      buffer.writeln(entry.format());
    }
    return buffer.toString();
  }

  Future<String> exportToFile([String? outputPath]) async {
    final timestamp =
        DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    final fileName = 'kikoflu_log_$timestamp.txt';

    if (outputPath != null) {
      final file = File(outputPath);
      await file.writeAsString(exportAsText());
      return file.path;
    }

    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, fileName));
    await file.writeAsString(exportAsText());
    return file.path;
  }

  /// 生成默认导出文件名
  String get exportFileName {
    final timestamp =
        DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    return 'kikoflu_log_$timestamp.txt';
  }
}

/// 初始化日志系统
void setupLogCapture() {
  LogService.instance.initialize();
}

void logOutput(Object? object) {
  LogService.instance.captureOutput(object.toString());
}
