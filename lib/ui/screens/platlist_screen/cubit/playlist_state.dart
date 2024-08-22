part of 'playlist_cubit.dart';

@immutable
sealed class PlaylistState {}

final class PlaylistInitial extends PlaylistState {}

final class PlaylistLoad extends PlaylistState {}

final class PlaylistSuccess extends PlaylistState {
  final PlaylistModel playlistModel;
  PlaylistSuccess(this.playlistModel);
}

final class PlaylistError extends PlaylistState {
  final String error;
  PlaylistError(this.error);
}
