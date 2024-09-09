import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/repo/album_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(AlbumInitial());

  final AlbumRepo _albumRepo = locator.get<AlbumRepo>();

  Future<void> getPlaylistInfo(AlbumModel model) async {
    emit(AlbumLoad());
    model = await _albumRepo.getArtistData(model);
    emit(AlbumSuccess(model));
  }

}
