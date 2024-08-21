import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
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
  int get index => _audioHandler.currentIndex;
  MusicModel? currentMusic;
  List<MusicModel> playList = [];

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

    emit(PlayerMiniLoad(index, playList));
    await _audioHandler.initSongs(index: startIndex);
    await _audioHandler.play();

    _listenToIndexChange();
  }

  void _listenToIndexChange() {
    _audioHandler.audioPlayer.processingStateStream.listen((state) async {
      if (state == ProcessingState.completed) {
        await playNext();
        emit(PlayerMiniLoad(index, playList));
        print("===============================playnext======================");
      }
      if (state == ProcessingState.ready) {
        emit(PlayerMiniLoad(index, playList));
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

  Future<void> playNext() async {
    final index = playList.indexWhere((e) => e == currentMusic) + 1;
    if (index < playList.length) {
      currentMusic = await _fetchDetailedMusicModel(playList[index]);
      await _audioHandler.skipToNext();
      emit(PlayerMiniLoad(index, playList));
    }
  }

  Future<void> playPrev() async {
    final index = playList.indexWhere((e) => e.id == currentMusic!.id) - 1;
    if (index >= 0) {
      currentMusic = await _fetchDetailedMusicModel(playList[index]);
      await _audioHandler.skipToPrevious();
      emit(PlayerMiniLoad(index, playList));
    }
  }

  Future<void> seekTOIndex(int index) async {
    if (index < 0 || index > playList.length) return;

    currentMusic = playList[index];
    currentMusic = await _fetchDetailedMusicModel(playList[index]);
    _audioHandler.skipToQueueItem(index);
    emit(PlayerMiniLoad(index, playList));
  }

  void onReorder(int oldIndex, int newIndex) {
    final oldMusic = playList.removeAt(oldIndex);
    playList.insert(newIndex, oldMusic);
  }
}
