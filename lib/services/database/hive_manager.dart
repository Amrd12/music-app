import 'dart:async';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart' as flutter;
import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/lyric_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/data/models/user_model.dart';

abstract class HiveManager<T> {
  String get boxName;

  Box<T> get box => Hive.box<T>(boxName);

  T getIfSaved(T m) {
    return box.values.firstWhere(
        (test) => (test as dynamic)?.id == (m as dynamic)?.id,
        orElse: () => m);
  }

  bool isSaved(T m) {
    return box.values.contains(m);
  }

  List<T> getAllSaved() => box.values.toList();

  Future<bool> addOrRemove(HiveObject m) async {
    if (m.isInBox) {
      await m.delete();
      return false;
    } else {
      await box.add(m as T);
      await m.save();
      return true;
    }
  }
}

Future<void> setupHive() async {
  //initFlutter
  await flutter.Hive.initFlutter();

  //hive regester adapter
  flutter.Hive.registerAdapter(LyricsModelAdapter());
  flutter.Hive.registerAdapter(MusicModelAdapter());
  flutter.Hive.registerAdapter(SearchModelAdapter());
  flutter.Hive.registerAdapter(UserModelAdapter());
  flutter.Hive.registerAdapter(ArtistModelAdapter());
  flutter.Hive.registerAdapter(AlbumModelAdapter());
  flutter.Hive.registerAdapter(PlaylistModelAdapter());
  //hive open boxes
  await Hive.openBox<MusicModel>(HiveConstants.musicBox);
  await Hive.openBox<SearchModel>(HiveConstants.searchBox);
  await Hive.openBox<UserModel>(HiveConstants.userBox);
  await Hive.openBox<ArtistModel>(HiveConstants.artistBox);
  await Hive.openBox<AlbumModel>(HiveConstants.albumBox);
  await Hive.openBox<PlaylistModel>(HiveConstants.playlistBox);
}
