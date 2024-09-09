part of 'artist_cubit.dart';

sealed class ArtistState {}

final class ArtistInitial extends ArtistState {}

final class ArtistLoad extends ArtistState {}

final class ArtistSuccess extends ArtistState {
  final ArtistModel artistModel;
  ArtistSuccess(this.artistModel);
}

final class ArtistError extends ArtistState {
  final String error;
  ArtistError(this.error);
}
