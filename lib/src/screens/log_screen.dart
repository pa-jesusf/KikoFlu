import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/log_service.dart';
import '../../l10n/app_localizations.dart';
import '../utils/snackbar_util.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final ScrollController _scrollController = ScrollController();
  StreamSubscription<LogEntry>? _subscription;
  List<LogEntry> _filteredLogs = [];
  LogLevel? _filterLevel;
  String _searchQuery = '';
  bool _autoScroll = true;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  static const int _maxDisplayLogs = 2000;

  @override
  void initState() {
    super.initState();
    _updateFilteredLogs();
    _subscription = LogService.instance.logStream.listen((_) {
      _updateFilteredLogs();
      if (_autoScroll) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _updateFilteredLogs() {
    setState(() {
      var logs = LogService.instance.logs.where((entry) {
        if (_filterLevel != null && entry.level != _filterLevel) return false;
        if (_searchQuery.isNotEmpty) {
          final text = entry.format().toLowerCase();
          if (!text.contains(_searchQuery.toLowerCase())) return false;
        }
        return true;
      }).toList();
      // 限制 UI 显示行数，只保留最新的
      if (logs.length > _maxDisplayLogs) {
        logs = logs.sublist(logs.length - _maxDisplayLogs);
      }
      _filteredLogs = logs;
    });
  }

  Color _levelColor(LogLevel level, BuildContext context) {
    switch (level) {
      case LogLevel.debug:
        return Theme.of(context).colorScheme.onSurfaceVariant;
      case LogLevel.info:
        return Theme.of(context).colorScheme.primary;
      case LogLevel.warning:
        return Colors.orange;
      case LogLevel.error:
        return Theme.of(context).colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: l10n.logSearchHint,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  _searchQuery = value;
                  _updateFilteredLogs();
                },
              )
            : Text(l10n.logTitle),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchQuery = '';
                  _searchController.clear();
                  _updateFilteredLogs();
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
          PopupMenuButton<LogLevel?>(
            icon: Icon(
              Icons.filter_list,
              color: _filterLevel != null
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
            onSelected: (level) {
              _filterLevel = level;
              _updateFilteredLogs();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: null,
                child: Text(l10n.logFilterAll),
              ),
              const PopupMenuItem(
                value: LogLevel.debug,
                child: Text('Debug'),
              ),
              const PopupMenuItem(
                value: LogLevel.info,
                child: Text('Info'),
              ),
              const PopupMenuItem(
                value: LogLevel.warning,
                child: Text('Warning'),
              ),
              const PopupMenuItem(
                value: LogLevel.error,
                child: Text('Error'),
              ),
            ],
          ),
          PopupMenuButton<String>(
            onSelected: (action) async {
              switch (action) {
                case 'copy':
                  await Clipboard.setData(
                    ClipboardData(text: LogService.instance.exportAsText()),
                  );
                  if (mounted) {
                    SnackBarUtil.showSuccess(context, l10n.logCopied);
                  }
                  break;
                case 'export':
                  try {
                    final path = await LogService.instance.exportToFile();
                    if (mounted) {
                      SnackBarUtil.showSuccess(
                        context,
                        l10n.logExported(path),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      SnackBarUtil.showError(context, e.toString());
                    }
                  }
                  break;
                case 'clear':
                  LogService.instance.clear();
                  _updateFilteredLogs();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'copy',
                child: ListTile(
                  leading: const Icon(Icons.copy),
                  title: Text(l10n.logCopy),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: const Icon(Icons.save_alt),
                  title: Text(l10n.logExport),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              PopupMenuItem(
                value: 'clear',
                child: ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: Text(l10n.logClear),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // 状态栏
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Row(
              children: [
                Text(
                  l10n.logCount(_filteredLogs.length),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      _autoScroll = !_autoScroll;
                    });
                    if (_autoScroll && _scrollController.hasClients) {
                      _scrollController.jumpTo(
                        _scrollController.position.maxScrollExtent,
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _autoScroll
                            ? Icons.vertical_align_bottom
                            : Icons.pause,
                        size: 14,
                        color: _autoScroll
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l10n.logAutoScroll,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: _autoScroll
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 日志列表
          Expanded(
            child: _filteredLogs.isEmpty
                ? Center(
                    child: Text(
                      l10n.logEmpty,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _filteredLogs.length,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    itemBuilder: (context, index) {
                      final entry = _filteredLogs[index];
                      return _LogEntryTile(
                        entry: entry,
                        levelColor: _levelColor(entry.level, context),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _LogEntryTile extends StatelessWidget {
  final LogEntry entry;
  final Color levelColor;

  const _LogEntryTile({
    required this.entry,
    required this.levelColor,
  });

  @override
  Widget build(BuildContext context) {
    final time =
        '${entry.timestamp.hour.toString().padLeft(2, '0')}:'
        '${entry.timestamp.minute.toString().padLeft(2, '0')}:'
        '${entry.timestamp.second.toString().padLeft(2, '0')}';

    return InkWell(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: entry.format()));
        SnackBarUtil.showSuccess(context, S.of(context).logCopied);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 时间
            Text(
              time,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
            ),
            const SizedBox(width: 6),
            // 级别标签
            Container(
              width: 16,
              alignment: Alignment.center,
              child: Text(
                entry.levelLabel,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: levelColor,
                ),
              ),
            ),
            const SizedBox(width: 6),
            // Tag + Message
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    if (entry.tag != null)
                      TextSpan(
                        text: '[${entry.tag}] ',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    TextSpan(
                      text: entry.message,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
