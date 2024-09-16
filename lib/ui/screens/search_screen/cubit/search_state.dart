part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

abstract class SearchResult extends SearchState {}

class MusicResult extends SearchResult {
  final List<MusicModel> musicList;

  MusicResult(this.musicList);

  MusicResult copyWith({
    List<MusicModel>? musicList,
  }) {
    return MusicResult(
      musicList ?? this.musicList,
    );
  }
}

class AlbumResult extends SearchResult {
  final List<AlbumModel> albumList;

  AlbumResult(this.albumList);

  AlbumResult copyWith({
    List<AlbumModel>? albumList,
  }) {
    return AlbumResult(
      albumList ?? this.albumList,
    );
  }
}

class ArtistResult extends SearchResult {
  final List<ArtistModel> artistList;

  ArtistResult(this.artistList);

  ArtistResult copyWith({
    List<ArtistModel>? artistList,
  }) {
    return ArtistResult(
      artistList ?? this.artistList,
    );
  }
}

class PlaylistResult extends SearchResult {
  final List<PlaylistModel> artistList;

  PlaylistResult(this.artistList);

  PlaylistResult copyWith({
    List<PlaylistModel>? artistList,
  }) {
    return PlaylistResult(
      artistList ?? this.artistList,
    );
  }
}

final class SearchLocal extends SearchState {
  final List<SearchModel> modelList;
  final ModelType? filterType;
  SearchLocal(this.modelList, {this.filterType});

  SearchLocal copyWith({List<SearchModel>? modelList, ModelType? filterType}) {
    return SearchLocal(
      modelList ?? this.modelList,
      filterType: filterType ?? this.filterType,
    );
  }
}

final class SearchItem extends SearchState {
  SearchModel model;
  SearchItem(this.model);
}

final class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  SearchError copyWith({
    String? message,
  }) {
    return SearchError(
      message ?? this.message,
    );
  }
}
