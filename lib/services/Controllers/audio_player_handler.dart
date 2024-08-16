import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final audioPlayer = AudioPlayer();
  final musicRepo = locator<MusicRepo>();
  List<MusicModel> playList = [];
  int currentIndex = 0;
  // Create a new audio source
  UriAudioSource _createAudioSource(String url) {
    return ProgressiveAudioSource(Uri.parse(url));
  }

  // Function to initialize the songs and set up the audio player
  Future<void> initSongs(
      {required List<MusicModel> musicModelSongs, int? mode}) async {
    playList = musicModelSongs;
    final songs =
        musicModelSongs.map((i) => modelToMediaItem(i, mode: mode)).toList();
    final audioSources =
        songs.map((item) => _createAudioSource(item.id)).toList();

    // Set the audio source of the audio player
    await audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: audioSources));

    // Listen for playback events and broadcast the state
    audioPlayer.playbackEventStream.listen(_broadcastState);
    queue.add(songs);

    _listenForCurrentSongIndexChanges();

    // Listen for processing state changes and skip to the next song when completed
    audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) skipToNext();
    });
  }

  MediaItem modelToMediaItem(MusicModel model, {int? mode}) {
    var formatData = (mode == null ||
            model.formates == null ||
            mode >= model.formates!.length)
        ? model.formates?.first.values.first
        : model.formates![mode].values.first;

    formatData ??= model.id;

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
    if (currentIndex < queue.value.length) {
      currentIndex++;
      MusicModel model = playList[currentIndex];

      if (!model.isDetailed ||
          model.formates == null ||
          model.formates!.isEmpty) {
        try {
          model = await musicRepo.getMusicData(model);
        } catch (e) {
          print('Error fetching music data: $e');
          return;
        }
      }

      var updatedItem = modelToMediaItem(model);

      // Create a new audio source for the updated item
      var newAudioSource = _createAudioSource(updatedItem.id);

      // Update the audio source of the audio player
      await audioPlayer.setAudioSource(newAudioSource,
          initialPosition: Duration.zero);
      try {
        await audioPlayer.seek(Duration.zero, index: currentIndex);
        await play();
      } catch (e) {
        print('Error skipping to next track: $e');
      }
    } else {
      await stop();
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (currentIndex > 0) {
      currentIndex--;
      MusicModel model = playList[currentIndex];

      if (model.isDetailed ||
          model.formates != null ||
          model.formates!.isEmpty) {
        try {
          model = await musicRepo.getMusicData(model);
        } catch (e) {
          print('Error fetching music data: $e');
          return;
        }
      }

      var updatedItem = modelToMediaItem(model);
      var newAudioSource = _createAudioSource(updatedItem.id);
      await audioPlayer.setAudioSource(newAudioSource,
          initialPosition: Duration.zero);
      try {
        await audioPlayer.seek(Duration.zero, index: currentIndex);
        await play();
      } catch (e) {
        print('Error skipping to previous track: $e');
      }
    } else {
      await stop();
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

  void _listenForCurrentSongIndexChanges() {
    audioPlayer.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) return;
      mediaItem.add(playlist[index]);
    });
  }
}
