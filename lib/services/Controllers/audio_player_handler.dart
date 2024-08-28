import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/lyrics_repo.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final audioPlayer = AudioPlayer();
  final MusicRepo _musicRepo = locator<MusicRepo>();
  final LyricsRepo _lyricsRepo = locator.get<LyricsRepo>();

  List<MusicModel> playList = [];
  int currentIndex = 0;

  Stream<int?> get currentIndexStream => audioPlayer.currentIndexStream;

  void setPlaylist(List<MusicModel> playlist) => playList = playlist;

  UriAudioSource _createAudioSource(String url) =>
      ProgressiveAudioSource(Uri.parse(url));

  // Function to initialize the songs and set up the audio player
  Future<void> initSongs({int index = 0}) async {
    currentIndex = index;

    final songs = playList.map((i) => modelToMediaItem(i)).toList();
    final audioSources =
        songs.map((item) => _createAudioSource(item.id)).toList();

    await audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: audioSources));
    audioPlayer.playbackEventStream.listen(_broadcastState);
    queue.add(songs);

    await skipToQueueItem(index);

    audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) skipToNext();
    });
  }

  MediaItem modelToMediaItem(MusicModel model) {
    final formatData = model.formates?.first.values.first ?? model.id;
    return MediaItem(
      id: formatData,
      title: model.title,
      artist: model.author,
      duration: Duration(seconds: model.seceunds?.floor() ?? 0),
      artUri: Uri.parse(model.thumbnail.first),
    );
  }

  @override
  Future<void> play() => audioPlayer.play();

  @override
  Future<void> pause() => audioPlayer.pause();

  @override
  Future<void> seek(Duration position) => audioPlayer.seek(position);

  @override
  Future<void> stop() => audioPlayer.stop();

  @override
  Future<void> skipToNext() async {
    if (currentIndex < playList.length - 1) {
      await skipToQueueItem(currentIndex + 1);
    } else {
      await stop();
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (currentIndex > 0) {
      await skipToQueueItem(currentIndex - 1);
    } else {
      await stop();
    }
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index >= 0 && index < playList.length) {
      currentIndex = index;
      MusicModel model = playList[currentIndex];

      if (!model.isDetailed ||
          model.formates == null ||
          model.formates!.isEmpty) {
        try {
          model = await _musicRepo.getMusicData(model);
        } catch (e) {
          log('Error fetching music data: $e');
          return;
        }
      }

      model.lyrics ??= await _lyricsRepo.getLyric(model.id);

      final updatedItem = modelToMediaItem(model);
      final newAudioSource = _createAudioSource(updatedItem.id);

      await audioPlayer.setAudioSource(newAudioSource,
          initialPosition: Duration.zero);
      try {
        await audioPlayer.seek(Duration.zero, index: currentIndex);
        await play();
      } catch (e) {
        log('Error skipping to queue item: $e');
      }
    } else {
      log('Invalid index: $index');
    }
  }

  void _broadcastState(PlaybackEvent event) {
    playbackState.add(playbackState.value.copyWith(
      controls: [
        MediaControl.skipToPrevious,
        if (audioPlayer.playing) MediaControl.pause else MediaControl.play,
        MediaControl.skipToNext,
      ],
      systemActions: {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[audioPlayer.processingState]!,
      playing: audioPlayer.playing,
      updatePosition: audioPlayer.position,
      bufferedPosition: audioPlayer.bufferedPosition,
      speed: audioPlayer.speed,
      queueIndex: event.currentIndex,
    ));
  }

  // void _listenForCurrentSongIndexChanges() {
  //   audioPlayer.currentIndexStream.listen((index) {
  //     print(
  //         "first===================================================================");
  //     final playlist = queue.value;
  //     if (index == null || playlist.isEmpty) return;
  //     skipToQueueItem(index);
  //   });
  // }
}
