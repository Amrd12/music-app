import 'package:musicapp/data/api/playlist_api_service.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/locator.dart';

class PlaylistRepo {
  final PlaylistApiService _apiService = locator.get<PlaylistApiService>();

  List<PlaylistModel> parsePlaylistModel(List<Map<String, dynamic>> map) =>
      List<PlaylistModel>.from(map.map((i) => PlaylistModel.fromMap(i)))
          .toList();

  Future<PlaylistModel> getPlaylistData(PlaylistModel playlist) async {
    final js = await _apiService.getPlaylistData(playlist.id);
    List<MusicModel> musicList = js["results"] != null
        ? List<MusicModel>.from(js["results"].map((e) => MusicModel.fromMap(e)))
        : [];

    return playlist.copyWith(
        playlistRelease: js["playlistRelease"],
        playlistAuthor: js["playlistAuthor"],
        playlistTotalDuration: js["playlistTotalDuration"],
        playlistTotalSong: js["playlistTotalSong"],
        musics: musicList);
  }
}
