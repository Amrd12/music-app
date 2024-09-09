import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistInitial());
  final PlaylistRepo _playlistRepo = locator.get<PlaylistRepo>();
  
  Future<void> getPlaylistInfo(PlaylistModel model) async {
    emit(PlaylistLoad());
    model = await _playlistRepo.getPlaylistData(model);
    emit(PlaylistSuccess(model));
  }
}
