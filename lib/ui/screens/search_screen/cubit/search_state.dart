part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

abstract class SearchResult extends SearchState {

}

class MusicResult extends SearchResult {
 final List<MusicModel> musicList;
  MusicResult(this.musicList);
}

class AlbumResult extends SearchResult {
 final List<AlbumModel> albumList;
  AlbumResult(this.albumList);
}

class ArtistResult extends SearchResult {
 final List<ArtistModel> artistList;
  ArtistResult(this.artistList);
}


final class SearchLocal extends SearchState {}

final class SearchItem extends SearchState {}

final class SearchError extends SearchState {}
