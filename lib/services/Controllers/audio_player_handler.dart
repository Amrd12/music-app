import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/data/models/music_model.dart';

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  void setPlaying(MusicModel model, {int? mode}) {
    MediaItem _item = MediaItem(
      id: mode == null
          ? model.formates!.first.values.first
          : model.formates![mode].values.first,
      title: model.title,
      artist: model.author,
      duration: Duration(seconds: model.seceunds!.floor()),
      artUri: Uri.parse(model.thumbnail.first),
    );
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    if (!_player.playbackEventStream.isBroadcast) {
      _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    } // ... and also the current media item via mediaItem.
    mediaItem.add(_item);
    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
    playbackState.add(PlaybackState(
      // Which buttons should appear in the notification now
      controls: [
        MediaControl.skipToPrevious,
        MediaControl.pause,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      // Which other actions should be enabled in the notification
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      // Which controls to show in Android's compact view.
      androidCompactActionIndices: const [0, 1, 3],
      // Whether audio is ready, buffering, ...
      processingState: AudioProcessingState.ready,
      // Whether audio is playing
      playing: true,
      // The current position as of this update. You should not broadcast
      // position changes continuously because listeners will be able to
      // project the current position after any elapsed time based on the
      // current speed and whether audio is playing and ready. Instead, only
      // broadcast position updates when they are different from expected (e.g.
      // buffering, or seeking).
      updatePosition: Duration(milliseconds: 54321),
      // The current buffered position as of this update
      bufferedPosition: Duration(milliseconds: 65432),
      // The current speed
      speed: 1.0,
      // The current queue position
      queueIndex: 0,
    ));
  }

  final _player = AudioPlayer();

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
