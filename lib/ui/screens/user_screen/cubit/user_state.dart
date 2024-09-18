part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class isUserLogin extends UserState {
  final bool isLogin;
  isUserLogin(this.isLogin);
}

final class CurrentUser extends UserState {
  final UserModel? user;
  CurrentUser({this.user});
  CurrentUser copyWith({UserModel? user}) => CurrentUser(
        user: user ?? this.user,
      );
}

final class GetUserData extends UserState {
  final List<MusicModel> musicList;
  final List<AlbumModel> albumList;
  final List<ArtistModel> artistList;
  final List<PlaylistModel> playlistList;

  GetUserData({
    required this.musicList,
    required this.albumList,
    required this.artistList,
    required this.playlistList,
  });
}
