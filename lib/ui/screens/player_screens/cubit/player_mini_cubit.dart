import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/services/primisions/request_song_permission.dart';

part 'player_mini_state.dart';

class PlayerMiniCubit extends Cubit<PlayerMiniState> {
  PlayerMiniCubit() : super(PlayerMiniInitial());
  final _audioHandler = locator.get<AudioPlayerHandler>();

  MusicRepo musicRepo = locator.get<MusicRepo>();
  MusicModel? currentMusic;

  List<MusicModel> playList = [];

  Future<void> loadAudio(MusicModel model) async {
    await requestSongPermission();
    if (!model.isDetailed ||
        model.formates == null ||
        model.formates!.isEmpty) {
      model = await musicRepo.getMusicData(model);
    }

    print("model isdetailed::? ${model.isDetailed}");
    currentMusic = model;
    playList = [model, ...await musicRepo.getNextMusic(model.id)];

    await _audioHandler.initSongs(
        musicModelSongs: playList); // Start playing the audio
    _audioHandler.play(); // Play the audio
    emit(PlayerMiniLoad(model, true));
  }

  void setCuruntValue(double sec) {
    emit(PlayerMiniSecounds(sec));
  }

  void visible(bool e) =>
      currentMusic != null ? emit(PlayerMiniLoad(currentMusic!, e)) : null;

  Future<void> playNext() async {
    _audioHandler.skipToNext();
    MusicModel model =
        playList[playList.indexWhere((e) => e.id == currentMusic!.id) + 1];

    currentMusic = await musicRepo.getMusicData(model);

    emit(PlayerMiniLoad(currentMusic!, true));
  }

  void playPrev() {
    int index = playList.indexWhere((e) => e.id == currentMusic!.id) - 1;
    if (index < 0) return;
    currentMusic = playList[index];
    emit(PlayerMiniLoad(currentMusic!, true));
    _audioHandler.skipToPrevious();
  }
}
