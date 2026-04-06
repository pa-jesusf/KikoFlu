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
    final time =
        '${timestamp.hour.toString().padLeft(2, '0')}:'
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

  void _addEntry(LogEntry entry) {
    // 截断过长的消息
    final truncated = entry.message.length > _maxMessageLength
        ? LogEntry(
            timestamp: entry.timestamp,
            level: entry.level,
            message: '${entry.message.substring(0, _maxMessageLength)}... (截断, 原长${entry.message.length})',
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
    if (lower.contains('error') || lower.contains('exception') || lower.contains('failed')) {
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
    buffer.writeln('Platform: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}');
    buffer.writeln('Entries: ${_logs.length}');
    buffer.writeln('');
    for (final entry in _logs) {
      buffer.writeln(entry.format());
    }
    return buffer.toString();
  }

  Future<String> exportToFile() async {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    final file = File(p.join(dir.path, 'kikoflu_log_$timestamp.txt'));
    await file.writeAsString(exportAsText());
    return file.path;
  }
}

/// 初始化日志系统
void setupLogCapture() {
  LogService.instance.initialize();
}
