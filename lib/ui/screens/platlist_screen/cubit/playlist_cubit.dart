import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/services/database/hive_playlist.dart';
part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistInitial());
  final PlaylistRepo _playlistRepo = locator.get<PlaylistRepo>();
  PlaylistModel? model;
  Future<void> getPlaylistInfo(PlaylistModel model) async {
    emit(PlaylistLoad());
    this.model = model = await _playlistRepo.getPlaylistData(model);
    emit(PlaylistSuccess(model));
  }

  Future<bool> add() async {
    final b = await locator.get<HivePlaylist>().addOrRemove(model!);
    emit(PlaylistSuccess(model!));
    return b;
  }
}
