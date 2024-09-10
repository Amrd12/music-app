import 'dart:developer';

import "package:flutter_bloc/flutter_bloc.dart";
import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/repo/album_repo.dart';
import 'package:musicapp/data/repo/artist_repo.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/locator.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final MusicRepo _musicRepo = locator.get<MusicRepo>();
  final PlaylistRepo _playlistRepo = locator.get<PlaylistRepo>();
  final AlbumRepo _albumRepo = locator.get<AlbumRepo>();
  final ArtistRepo _artistRepo = locator.get<ArtistRepo>();
  late HomeScreenSuccess success;

  HomeScreenCubit() : super(HomeScreenInitial());

  void getPage() async {
    emit(HomeScreenLoading());
    final js = await ApiService().apiHomePage();

    if (js["error"] != null) {
      emit(HomeScreenError(error: js["error"]));
      return;
    }
    List<Map<String, dynamic>> l = List<Map<String, dynamic>>.from(
        js["results"][ApiConstantsResponse.quickhomeVidoes]);
    // final l = js["results"][ApiConstantsResponse.quickhomeVidoes];

    final quickPicks = _musicRepo.parseMusicModel(l);

    l = List<Map<String, dynamic>>.from(
        js["results"]["charts"]["trending"]["list"]);
    final trendingmusic = _musicRepo.parseMusicModel(l);

    final topMusicVideos = _musicRepo.parseMusicModel(l);

    List<PlaylistModel>? boostYourMood =
        _parsePlayList(js["results"]["boost_your_mood"]);
    List<PlaylistModel>? afterWorkFeeling =
        _parsePlayList(js["results"]["after_work_feeling"]);
    List<PlaylistModel>? summer_2024 =
        _parsePlayList(js["results"]["summer_2024_☀️🌴🍉"]);
    List<PlaylistModel>? enjoyingTheMorning =
        _parsePlayList(js["results"]["enjoying_the_morning"]);

    List<AlbumModel>? newReleaseAlbums =
        _parseAlbum(js["results"]["new_release_albums"]);

    List<ArtistModel>? topArtist =
        _parseArtist(js["results"]["charts"]["top_artists"]["list"]);

    success = HomeScreenSuccess(
      quickPicks: quickPicks,
      boostYourMood: boostYourMood,
      summer_2024: summer_2024,
      afterWorkFeeling: afterWorkFeeling,
      enjoyingTheMorning: enjoyingTheMorning,
      newReleaseAlbums: newReleaseAlbums,
      topMusics: topMusicVideos,
      topArtist: topArtist,
      trendingMusic: trendingmusic,
    );

    emit(success);
  }

  List<MusicModel>? _parseMusic(dynamic l) {
    if (l == null) return null;
    List<Map<String, dynamic>> playlistMoods =
        List<Map<String, dynamic>>.from(l);

    // playlistMoods.map((e) => e["id"] = e.remove("browseId")).toList();

    List<MusicModel> boostYourMood =
        List<MusicModel>.from(_musicRepo.parseMusicModel(playlistMoods));
    return boostYourMood;
  }

  List<PlaylistModel>? _parsePlayList(List<dynamic>? js) {
    if (js == null) return null;
    List<Map<String, dynamic>> playlistMoods =
        List<Map<String, dynamic>>.from(js);

    playlistMoods.map((e) => e["id"] = e.remove("browseId")).toList();

    List<PlaylistModel> boostYourMood = List<PlaylistModel>.from(
        _playlistRepo.parsePlaylistModel(playlistMoods));
    return boostYourMood;
  }

  List<ArtistModel>? _parseArtist(List<dynamic>? js) {
    if (js == null) return null;
    List<Map<String, dynamic>> playlistMoods =
        List<Map<String, dynamic>>.from(js);

    // playlistMoods.map((e) => e["id"] = e.remove("browseId")).toList();

    List<ArtistModel> boostYourMood =
        List<ArtistModel>.from(_artistRepo.parseArtistModel(playlistMoods));

    return boostYourMood;
  }

  List<AlbumModel>? _parseAlbum(List<dynamic>? js) {
    if (js == null) return null;
    List<Map<String, dynamic>> playlistMoods =
        List<Map<String, dynamic>>.from(js);

    // playlistMoods.map((e) => e["id"] = e.remove("browseId")).toList();

    List<AlbumModel> boostYourMood =
        List<AlbumModel>.from(_albumRepo.parseAlbumModel(playlistMoods));
    return boostYourMood;
  }
}
