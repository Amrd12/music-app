import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/enums/user_icons.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/database/hive_album.dart';
import 'package:musicapp/services/database/hive_artist.dart';
import 'package:musicapp/services/database/hive_music.dart';
import 'package:musicapp/services/database/hive_playlist.dart';
import 'package:musicapp/services/database/hive_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final HiveUser _user = locator.get<HiveUser>();
  final HiveAlbum _album = locator.get<HiveAlbum>();
  final HiveArtist _artist = locator.get<HiveArtist>();
  final HiveMusic _music = locator.get<HiveMusic>();
  final HivePlaylist _playlist = locator.get<HivePlaylist>();

  bool get _isLogin => _user.islogin;

  CurrentUser user = CurrentUser();

  UserCubit() : super(UserInitial()) {
    getLogin();
  }

  void getLogin() {
    log(_isLogin.toString());
    emit(isUserLogin(_isLogin));
    if (_isLogin) {
      emit(CurrentUser(user: _user.userModel));
    }
  }

  void getUser() => emit(user = CurrentUser(user: _user.userModel));

  void setUser() {
    _user.setUser(user.user!);
    emit(isUserLogin(_isLogin));
  }

  void delUser() async {
    log("del");
    await _user.delUser();
    log("message user deleted");
    getLogin();
  }

  void setName(String name) {
    UserModel userModel = user.user == null
        ? UserModel(name: name, pic: UserIcons.userIcon1.name)
        : user.user!.copyWith(name: name);
    emit(user = user.copyWith(user: userModel));
  }

  void setPic(UserIcons icon) {
    UserModel userModel = user.user == null
        ? UserModel(name: "", pic: icon.name)
        : user.user!.copyWith(pic: icon.name);
    emit(user = user.copyWith(user: userModel));
  }

  void getdata() => emit(GetUserData(
      musicList: _music.getAllSaved(),
      albumList: _album.getAllSaved(),
      artistList: _artist.getAllSaved(),
      playlistList: _playlist.getAllSaved()));
}
