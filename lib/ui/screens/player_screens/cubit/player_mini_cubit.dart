import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/lyrics_repo.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/services/primisions/request_song_permission.dart';

part 'player_mini_state.dart';

class PlayerMiniCubit extends Cubit<PlayerMiniState> {
  PlayerMiniCubit() : super(PlayerMiniInitial());

  final AudioPlayerHandler _audioHandler = locator.get<AudioPlayerHandler>();
  final MusicRepo _musicRepo = locator.get<MusicRepo>();
  final LyricsRepo _lyricsRepo = locator.get<LyricsRepo>();

  List<MusicModel> playList = [];

  int get currentIndex => _audioHandler.currentIndex;

  set currentIndex(int x) => _audioHandler.currentIndex = x;

  Future<void> loadAudio(MusicModel model) async {
    await requestSongPermission();

    model = await _fetchDetailedMusicModel(model);
    playList = [model, ...await _musicRepo.getNextMusic(model.id)];
    await startPlaying(0);
  }

  Future<void> loadPlaylist(List<MusicModel> playlist, int startIndex) async {
    if (playlist.isEmpty || startIndex < 0 || startIndex >= playlist.length) {
      throw ArgumentError('Invalid playlist or startIndex');
    }

    playList = playlist;
    await startPlaying(startIndex);
  }

  Future<void> startPlaying(int startIndex) async {
    _audioHandler.setPlaylist(playList);
    await _audioHandler.initSongs(index: startIndex);
    await _audioHandler.play();
    _listenToIndexChange();
    emit(PlayerMiniLoad(currentIndex, true, playList));
  }

  void _listenToIndexChange() {
    _audioHandler.currentIndexStream.listen((index) async {
      if (index != null && currentIndex != index) {
        await _audioHandler.play();
        currentIndex = index;
        emit(PlayerMiniLoad(currentIndex, true, playList));
      }
    });
  }

  Future<MusicModel> _fetchDetailedMusicModel(MusicModel model) async {
    if (!model.isDetailed ||
        model.formates == null ||
        model.formates!.isEmpty) {
      return await _musicRepo.getMusicData(model);
    }
    model.lyrics ??= await _lyricsRepo.getLyric(model.id);
    return model;
  }

  void visible(bool isVisible) {
    if (currentIndex >= 0 && currentIndex < playList.length) {
      emit(PlayerMiniLoad(currentIndex, isVisible, playList));
    }
  }

  Future<void> playNext() async => await _audioHandler.skipToNext();

  Future<void> playPrev() async => await _audioHandler.skipToPrevious();

  void onReorder(int oldIndex, int newIndex) {
    final oldMusic = playList.removeAt(oldIndex);
    playList.insert(newIndex, oldMusic);
  }

  Future<void> seekToIndex(int index) async {
    if (index < 0 || index >= playList.length) return;
    currentIndex = index;
    await _audioHandler.skipToQueueItem(index);
  }
}
