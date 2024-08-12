import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';

part 'player_mini_state.dart';

class PlayerMiniCubit extends Cubit<PlayerMiniState> {
  PlayerMiniCubit() : super(PlayerMiniInitial());

  MusicRepo musicRepo = locator.get<MusicRepo>();

  Future<void> loadAudio(MusicModel model) async {
    if (!model.isDetailed ||
        model.formates == null ||
        model.formates!.isEmpty) {
      model = await musicRepo.getMusicData(model);
    }
    print("model isdetailed::? ${model.isDetailed}");
    emit(PlayerMiniLoad(model, true));
  }
}
