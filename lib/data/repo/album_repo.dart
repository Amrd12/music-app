import 'package:musicapp/data/api/album_api_service.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/locator.dart';

class AlbumRepo {
  final AlbumApiService _apiService = locator.get<AlbumApiService>();

  List<AlbumModel> parseAlbumModel(List<Map<String, dynamic>> map) =>
      List<AlbumModel>.from(map.map((i) => AlbumModel.fromMap(i))).toList();

  Future<AlbumModel> getAlbumData(AlbumModel album) async {
    final js = await _apiService.getPlaylistData(album.id);

    List<MusicModel> musicList = js["results"] != null
        ? List<MusicModel>.from(js["results"].map((e) => MusicModel.fromMap(e)))
        : [];

    return album.copyWith(
        title: js["title"],
        playlistRelease: js["albumRelease"],
        playlistAuthor: js["albumAuthor"],
        playlistTotalDuration: js["albumTotalDuration"],
        playlistTotalSong: js["albumTotalSong"],
        thumbnail: js["albumCover"],
        musics: musicList);
  }
}
