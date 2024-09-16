import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/data/repo/search_repo.dart';
import 'package:musicapp/enums/model_type.dart';
import 'package:musicapp/locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final SearchRepo _searchRepo = locator.get<SearchRepo>();
  // final HiveSearch _hiveSearch = locator.get<HiveSearch>();

  late SearchResult result;
  late SearchLocal local;

  Future<void> search(SearchModel model) async {
    try {
      emit(SearchLoading()); // Loading state
      switch (model.type.toModelType()) {
        case ModelType.music:
          final List<MusicModel> musicList = await _searchRepo.getMusic(model);
          result = MusicResult(musicList);
          break;
        case ModelType.album:
          final List<AlbumModel> albumList = await _searchRepo.getAlbum(model);
          result = AlbumResult(albumList);
          break;
        case ModelType.artist:
          final List<ArtistModel> artistList =
              await _searchRepo.getArtist(model);
          result = ArtistResult(artistList);
          break;
        case ModelType.playlist:
          final List<PlaylistModel> playlistList =
              await _searchRepo.getPlaylist(model);
          result = PlaylistResult(playlistList);
          break;
        default:
          throw Exception('Unknown search type');
      }
      emit(result);
    } catch (error) {
      emit(SearchError(error.toString())); // Error state
    }
  }

  void loadLocal() {
    // final local = SearchLocal(_hiveSearch.getAllSaved());
    local = SearchLocal([
      SearchModel(querry: "riell", type: ModelType.music.toString()),
      SearchModel(querry: "riell", type: ModelType.playlist.toString()),
      SearchModel(querry: "riell", type: ModelType.album.toString()),
      SearchModel(querry: "riell", type: ModelType.artist.toString()),
    ]);

    emit(local);
  }

  void filterSearch({ModelType? type}) {
    late List<SearchModel> modelList;
    switch (type) {
      case ModelType.music:
        modelList = local.modelList
            .where((test) => test.type == ModelType.music.toString())
            .toList();

      case ModelType.playlist:
        modelList = local.modelList
            .where((test) => test.type == ModelType.playlist.toString())
            .toList();

      case ModelType.artist:
        modelList = local.modelList
            .where((test) => test.type == ModelType.artist.toString())
            .toList();

      case ModelType.album:
        modelList = local.modelList
            .where((test) => test.type == ModelType.album.toString())
            .toList();

      default:
        modelList = local.modelList;
    }
    emit(local.copyWith(modelList: modelList, filterType: type));
  }

  void setItem(SearchModel model) => emit(SearchItem(model));
}
