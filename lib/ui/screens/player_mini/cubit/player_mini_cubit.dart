import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:permission_handler/permission_handler.dart';

part 'player_mini_state.dart';

class PlayerMiniCubit extends Cubit<PlayerMiniState> {
  PlayerMiniCubit() : super(PlayerMiniInitial());
  final _audioHandler = locator.get<AudioPlayerHandler>();

  MusicRepo musicRepo = locator.get<MusicRepo>();

  Future<void> loadAudio(MusicModel model) async {
    //TODO Handel Premisions
    if (!model.isDetailed ||
        model.formates == null ||
        model.formates!.isEmpty) {
      model = await musicRepo.getMusicData(model);
    }
    if (await Permission.audio.isDenied ||
        await Permission.audio.isPermanentlyDenied) {
      final state = await Permission.audio.request();
      if (!state.isGranted) {
        print("no access");
      } else {
        print(" access");
      }
    }
    print("model isdetailed::? ${model.isDetailed}");
    _audioHandler.setPlaying(model); // Start playing the audio
    _audioHandler.play(); // Play the audio
    emit(PlayerMiniLoad(model, true));
  }

  void setCuruntValue(double sec) {
    emit(PlayerMiniSecounds(sec));
  }
}
