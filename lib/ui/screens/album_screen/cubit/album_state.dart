part of 'album_cubit.dart';

sealed class AlbumState {}

final class AlbumInitial extends AlbumState {}

final class AlbumLoad extends AlbumState {}

final class AlbumSuccess extends AlbumState {
  final AlbumModel albumModel;
 AlbumSuccess(this.albumModel);
}

final class AlbumError extends AlbumState {
  final String error;
 AlbumError(this.error);
}
