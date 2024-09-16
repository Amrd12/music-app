import 'package:musicapp/data/api/search_api_service.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/data/repo/album_repo.dart';
import 'package:musicapp/data/repo/artist_repo.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/locator.dart';

class SearchRepo {
  final SearchApiService _service = locator.get<SearchApiService>();
  final MusicRepo _musicRepo = locator.get<MusicRepo>();
  final AlbumRepo _albumRepo = locator.get<AlbumRepo>();
  final ArtistRepo _artistRepo = locator.get<ArtistRepo>();
  final PlaylistRepo _playlistRepo = locator.get<PlaylistRepo>();

  Future<List<MusicModel>> getMusic(SearchModel model) async {
    final data = await _service.getSearchtData(model.querry, model.type);
    List<Map<String, dynamic>> l =
        List<Map<String, dynamic>>.from(data["result"]);
    return _musicRepo.parseMusicModel(l);
  }

  Future<List<AlbumModel>> getAlbum(SearchModel model) async {
    final data = await _service.getSearchtData(model.querry, model.type);
    List<Map<String, dynamic>> l =
        List<Map<String, dynamic>>.from(data["result"]);
    return _albumRepo.parseAlbumModel(l);
  }

  Future<List<ArtistModel>> getArtist(SearchModel model) async {
    final data = await _service.getSearchtData(model.querry, model.type);
    List<Map<String, dynamic>> l =
        List<Map<String, dynamic>>.from(data["result"]);

    return _artistRepo.parseArtistModel(l);
  }

  Future<List<PlaylistModel>> getPlaylist(SearchModel model) async {
    final data = await _service.getSearchtData(model.querry, model.type);
    List<Map<String, dynamic>> l =
        List<Map<String, dynamic>>.from(data["result"]);
        
    return _playlistRepo.parsePlaylistModel(l);
  }
}
