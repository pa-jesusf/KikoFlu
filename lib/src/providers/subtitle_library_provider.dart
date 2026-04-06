import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/subtitle_library_service.dart';
import '../services/subtitle_database.dart';

final subtitleLibraryProvider = StateNotifierProvider<SubtitleLibraryNotifier, Set<int>>((ref) {
  return SubtitleLibraryNotifier();
});

class SubtitleLibraryNotifier extends StateNotifier<Set<int>> {
  StreamSubscription? _subscription;

  SubtitleLibraryNotifier() : super({}) {
    _init();
  }

  void _init() {
    refresh();
    _subscription = SubtitleLibraryService.onCacheUpdated.listen((_) {
      refresh();
    });
  }

  Future<void> refresh() async {
    try {
      final ids = await SubtitleDatabase.instance.getDistinctWorkIds();
      if (mounted) {
        state = ids;
      }
    } catch (e) {
      // 数据库尚未初始化时回退到旧方式
      final parsedFolders = await SubtitleLibraryService.getParsedSubtitleFolders();
      
      final ids = <int>{};
      final regex = RegExp(r'RJ(\d+)', caseSensitive: false);

      for (final folder in parsedFolders) {
        final match = regex.firstMatch(folder);
        if (match != null) {
          final idStr = match.group(1);
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              ids.add(id);
            }
          }
        }
      }

      if (mounted) {
        state = ids;
      }
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
