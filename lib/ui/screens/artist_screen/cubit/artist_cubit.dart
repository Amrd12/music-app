import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/repo/artist_repo.dart';
import 'package:musicapp/locator.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  ArtistCubit() : super(ArtistInitial());
  final ArtistRepo _albumRepo = locator.get<ArtistRepo>();

  Future<void> getArtistInfo(ArtistModel model) async {
    emit(ArtistLoad());
    model = await _albumRepo.getArtistData(model);
    emit(ArtistSuccess(model));
  }
}
