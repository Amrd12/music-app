import 'package:musicapp/data/api/artist_api_service.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/locator.dart';

class ArtistRepo {
  final ArtistApiService _apiService = locator.get<ArtistApiService>();

  List<ArtistModel> parseArtistModel(List<Map<String, dynamic>> map) {

    return List<ArtistModel>.from(map.map((i) => ArtistModel.fromMap(i)))
        .toList();
  }

  Future<ArtistModel> getArtistData(ArtistModel artist) async {
    final js = await _apiService.getPlaylistData(artist.channelId);

    List<MusicModel> musicList = js["songs"] != null
        ? List<MusicModel>.from(
            js["songs"]["contents"].map((e) => MusicModel.fromMap(e)))
        : [];
    List<MusicModel> songsList = js["songs"] != null
        ? List<MusicModel>.from(
            js["songs"]["contents"].map((e) => MusicModel.fromMap(e)))
        : [];

    List<AlbumModel> albumList = js["albums"] != null
        ? List<AlbumModel>.from(
            js["albums"]["contents"].map((e) => AlbumModel.fromMap(e)))
        : [];
    List<AlbumModel> singlesList = js["singles"] != null
        ? List<AlbumModel>.from(
            js["singles"]["contents"].map((e) => AlbumModel.fromMap(e)))
        : [];

    List<AlbumModel> playlistList = js["featured_on"] != null
        ? List<AlbumModel>.from(
            js["featured_on"]["contents"].map((e) => AlbumModel.fromMap(e)))
        : [];
    List<ArtistModel> artistList = js["fans_might_also_like"] != null
        ? List<ArtistModel>.from(js["fans_might_also_like"]["contents"]
            .map((e) => ArtistModel.fromMap(e)))
        : [];

    return artist.copyWith(
        title: js["title"],
        description: js["description"],
        thumbnail: js["thumbnail"],
        subscriberText: js["subscriberCount"],
        musics: musicList,
        albums: albumList,
        singles: singlesList,
        songs: songsList,
        playlist: playlistList,
        artist: artistList);
  }
}
