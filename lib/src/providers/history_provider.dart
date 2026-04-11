import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/work.dart';
import '../models/history_record.dart';
import '../models/audio_track.dart';
import '../services/history_database.dart';
import '../services/audio_player_service.dart' as import_service;
import '../services/playback_history_service.dart';

class HistoryState {
  final List<HistoryRecord> records;
  final bool isLoading;
  final int currentPage;
  final int totalCount;
  final int pageSize;
  final bool hasMore;

  const HistoryState({
    this.records = const [],
    this.isLoading = false,
    this.currentPage = 1,
    this.totalCount = 0,
    this.pageSize = 20,
    this.hasMore = true,
  });

  HistoryState copyWith({
    List<HistoryRecord>? records,
    bool? isLoading,
    int? currentPage,
    int? totalCount,
    int? pageSize,
    bool? hasMore,
  }) {
    return HistoryState(
      records: records ?? this.records,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

final historyProvider =
    StateNotifierProvider<HistoryNotifier, HistoryState>((ref) {
  return HistoryNotifier(ref);
});

class HistoryNotifier extends StateNotifier<HistoryState> {
  // ignore: unused_field - kept for potential future use with Ref
  final Ref _ref;

  HistoryNotifier(this._ref) : super(const HistoryState()) {
    load(refresh: true);
    _initHistoryUpdateListener();
  }

  StreamSubscription? _historyUpdateSubscription;
  DateTime _lastRefreshTime = DateTime.now();

  Future<void> load({bool refresh = false, bool force = false}) async {
    if (state.isLoading && !force) return;

    final page = refresh ? 1 : state.currentPage;

    state = state.copyWith(isLoading: true, currentPage: page);

    try {
      final offset = (page - 1) * state.pageSize;
      final records = await HistoryDatabase.instance.getAllHistory(
        limit: state.pageSize,
        offset: offset,
      );
      final totalCount = await HistoryDatabase.instance.getHistoryCount();

      state = state.copyWith(
        records: records,
        currentPage: page,
        totalCount: totalCount,
        hasMore: (offset + records.length) < totalCount,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print('Failed to load history: $e');
    }
  }

  Future<void> refresh() async {
    await load(refresh: true);
  }

  Future<void> nextPage() async {
    if (state.hasMore && !state.isLoading) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      await load();
    }
  }

  Future<void> previousPage() async {
    if (state.currentPage > 1 && !state.isLoading) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      await load();
    }
  }

  Future<void> goToPage(int page) async {
    if (state.isLoading || page == state.currentPage) return;
    state = state.copyWith(currentPage: page);
    await load();
  }

  /// 外部直接写入历史（例如 history_work_card 恢复播放时）
  Future<void> addOrUpdate(Work work,
      {AudioTrack? track, int? positionMs}) async {
    final now = DateTime.now();
    final audioService = PlaybackHistoryService.instance;

    int playlistIndex = 0;
    int playlistTotal = 0;

    // 尝试从播放历史服务获取播放列表信息
    if (audioService.currentWorkId == work.id) {
      playlistIndex = audioService.currentTrack != null
          ? AudioPlayerServiceHelper.currentIndex
          : 0;
      playlistTotal = AudioPlayerServiceHelper.queueLength;
    }

    final existingIndex = state.records.indexWhere((r) => r.work.id == work.id);
    HistoryRecord record;

    if (existingIndex >= 0) {
      final existing = state.records[existingIndex];
      record = existing.copyWith(
        work: work,
        lastPlayedTime: now,
        lastTrack: track ?? existing.lastTrack,
        lastPositionMs: positionMs ?? existing.lastPositionMs,
        playlistIndex:
            playlistIndex > 0 ? playlistIndex : existing.playlistIndex,
        playlistTotal:
            playlistTotal > 0 ? playlistTotal : existing.playlistTotal,
      );
    } else {
      record = HistoryRecord(
        work: work,
        lastPlayedTime: now,
        lastTrack: track,
        lastPositionMs: positionMs ?? 0,
        playlistIndex: playlistIndex,
        playlistTotal: playlistTotal,
      );
    }

    await HistoryDatabase.instance.addOrUpdate(record);
    await load(force: true);
  }

  Future<void> remove(int workId) async {
    await HistoryDatabase.instance.delete(workId);
    await load(force: true);
  }

  Future<void> clear() async {
    await HistoryDatabase.instance.clear();
    state = state.copyWith(records: [], totalCount: 0, currentPage: 1);
  }

  /// 监听 PlaybackHistoryService 的写入通知，节流刷新列表
  void _initHistoryUpdateListener() {
    _historyUpdateSubscription =
        PlaybackHistoryService.instance.historyUpdatedStream.listen((_) {
      final now = DateTime.now();
      // 节流：10 秒内最多刷新一次列表
      if (now.difference(_lastRefreshTime).inSeconds >= 10) {
        _lastRefreshTime = now;
        load(refresh: true, force: true);
      }
    });
  }

  @override
  void dispose() {
    _historyUpdateSubscription?.cancel();
    super.dispose();
  }
}

/// 帮助类，用于从 AudioPlayerService 获取播放列表信息
/// 避免直接在 provider 层级依赖 AudioPlayerService 的内部状态
class AudioPlayerServiceHelper {
  static int get currentIndex {
    try {
      return _audioPlayerService.currentIndex;
    } catch (_) {
      return 0;
    }
  }

  static int get queueLength {
    try {
      return _audioPlayerService.queue.length;
    } catch (_) {
      return 0;
    }
  }

  static import_service.AudioPlayerService get _audioPlayerService =>
      import_service.AudioPlayerService.instance;
}
