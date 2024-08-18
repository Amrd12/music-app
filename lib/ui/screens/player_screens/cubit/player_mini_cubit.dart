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

  MusicModel? currentMusic;
  List<MusicModel> playList = [];

  Future<void> loadAudio(MusicModel model) async {
    await requestSongPermission();

    model = await _fetchDetailedMusicModel(model);

    currentMusic = model;
    currentMusic?.lyrics = await _lyricsRepo.getLyric(currentMusic!.id);

    playList = [model, ...await _musicRepo.getNextMusic(model.id)];

    emit(PlayerMiniLoad(model, true, playList));
    await _audioHandler.initSongs(musicModelSongs: playList);
    await _audioHandler.play();
    _listenToIndexChange();
  }

  void _listenToIndexChange() {
    _audioHandler.currentIndexStream.listen((index) async {
      final cureentindex = playList.indexWhere((e) => e == currentMusic) + 1;
      if (index != null && cureentindex != index) {
        currentMusic = playList[index];
        seekTOIndex(index);
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

  void visible(bool e) {
    if (currentMusic != null) {
      emit(PlayerMiniLoad(currentMusic!, e, playList));
    }
  }

  Future<void> playNext() async {
    final index = playList.indexWhere((e) => e == currentMusic) + 1;
    if (index < playList.length) {
      currentMusic = await _fetchDetailedMusicModel(playList[index]);

      await _audioHandler.skipToNext();
      emit(PlayerMiniLoad(currentMusic!, true, playList));
    }
  }

  Future<void> playPrev() async {
    final index = playList.indexWhere((e) => e.id == currentMusic!.id) - 1;
    if (index >= 0) {
      currentMusic = await _fetchDetailedMusicModel(playList[index]);

      await _audioHandler.skipToPrevious();
      emit(PlayerMiniLoad(currentMusic!, true, playList));
    }
  }

  Future<void> seekTOIndex(int index) async {
    if (index < 0 || index > playList.length) return;

    currentMusic = playList[index];
    currentMusic = await _fetchDetailedMusicModel(playList[index]);
    _audioHandler.skipToQueueItem(index);
    emit(PlayerMiniLoad(currentMusic!, true, playList));
  }
}
