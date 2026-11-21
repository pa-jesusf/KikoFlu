import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kikoeru_flutter/src/models/audio_track.dart';
import 'package:kikoeru_flutter/src/services/audio_player_service.dart';

const _tracks = [
  AudioTrack(id: '1', title: 'First', url: 'https://example.test/1'),
  AudioTrack(id: '2', title: 'Second', url: 'https://example.test/2'),
  AudioTrack(id: '3', title: 'Third', url: 'https://example.test/3'),
];

class _Player extends Fake implements AudioPlayer {
  final states = StreamController<PlayerState>.broadcast();
  final loadedUrls = <String>[];

  @override
  bool playing = false;
  @override
  ProcessingState processingState = ProcessingState.ready;
  @override
  PlayerState get playerState => PlayerState(playing, processingState);
  @override
  Stream<PlayerState> get playerStateStream => states.stream;
  @override
  Stream<Duration> get positionStream => const Stream.empty();
  @override
  Stream<Duration?> get durationStream => const Stream.empty();
  @override
  Duration get position => Duration.zero;
  @override
  Duration? get duration => null;

  @override
  Future<void> play() async => playing = true;
  @override
  Future<void> pause() async => playing = false;
  @override
  Future<void> seek(Duration? position, {int? index}) async {}
  @override
  Future<Duration?> setUrl(
    String url, {
    Map<String, String>? headers,
    Duration? initialPosition,
    bool preload = true,
    dynamic tag,
  }) async {
    loadedUrls.add(url);
    return const Duration(minutes: 1);
  }

  @override
  Future<void> setLoopMode(LoopMode mode) async {}
  @override
  Future<void> dispose() => states.close();
}

class _Service extends AudioPlayerService {
  _Service(super.player, {required super.queue}) : super.forTesting();

  @override
  Future<void> persistPlaybackPosition() async {}
  @override
  Future<void> persistPlaybackSession() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<(_Player, _Service)> atIndex(int index, LoopMode mode) async {
    final player = _Player();
    final service = _Service(player, queue: _tracks);
    await service.setRepeatMode(mode);
    await service.skipToIndex(index);
    player.loadedUrls.clear();
    return (player, service);
  }

  for (final mode in [LoopMode.all, LoopMode.one]) {
    test('next on the last track wraps to the first in $mode', () async {
      final (player, service) = await atIndex(2, mode);
      await service.skipToNext();
      expect(service.currentIndex, 0);
      expect(player.loadedUrls, ['https://example.test/1']);
      expect(player.playing, isTrue);
      await service.dispose();
    });

    test('previous on the first track wraps to the last in $mode', () async {
      final (player, service) = await atIndex(0, mode);
      await service.skipToPrevious();
      expect(service.currentIndex, 2);
      expect(player.loadedUrls, ['https://example.test/3']);
      await service.dispose();
    });
  }

  test('without repeat, next on the last track still reports no next track',
      () async {
    final (player, service) = await atIndex(2, LoopMode.off);
    await expectLater(service.skipToNext(), throwsException);
    expect(service.currentIndex, 2);
    expect(player.loadedUrls, isEmpty);
    await service.dispose();
  });

  test('next in the middle of the queue is unchanged', () async {
    final (_, service) = await atIndex(0, LoopMode.all);
    await service.skipToNext();
    expect(service.currentIndex, 1);
    await service.dispose();
  });
}
