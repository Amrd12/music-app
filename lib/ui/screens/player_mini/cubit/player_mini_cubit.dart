import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/music_model.dart';

part 'player_mini_state.dart';

class PlayerMiniCubit extends Cubit<PlayerMiniState> {
  PlayerMiniCubit() : super(PlayerMiniInitial());
  Future<void> startAudio(MusicModel model) async {
    if (!model.isDetailed ||
        model.formates == null ||
        model.formates!.isEmpty) {}
  }
}
