part of 'home_screen_cubit.dart';

sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenSuccess extends HomeScreenState {
  final List<MusicModel>? quickPicks;
  final List<PlaylistModel>? boostYourMood;
  final List<PlaylistModel>? summer_2024;
  final List<PlaylistModel>? afterWorkFeeling;
  final List<PlaylistModel>? enjoyingTheMorning;
  final List<AlbumModel>? newReleaseAlbums;
  final List<MusicModel>? topMusics;
  final List<ArtistModel>? topArtist;
  final List<MusicModel>? trendingMusic;

  HomeScreenSuccess({
    this.quickPicks,
    this.boostYourMood,
    this.summer_2024,
    this.afterWorkFeeling,
    this.enjoyingTheMorning,
    this.newReleaseAlbums,
    this.topMusics,
    this.topArtist,
    this.trendingMusic,
  });

  HomeScreenSuccess copyWith({
    List<MusicModel>? quickPicks,
    List<PlaylistModel>? boostYourMood,
    List<PlaylistModel>? summer_2024,
    List<PlaylistModel>? afterWorkFeeling,
    List<PlaylistModel>? enjoyingTheMorning,
    List<AlbumModel>? newReleaseAlbums,
    List<MusicModel>? topMusics,
    List<ArtistModel>? topArtist,
    List<MusicModel>? trendingMusic,
  }) {
    return HomeScreenSuccess(
      quickPicks: quickPicks ?? this.quickPicks,
      boostYourMood: boostYourMood ?? this.boostYourMood,
      summer_2024: summer_2024 ?? this.summer_2024,
      afterWorkFeeling: afterWorkFeeling ?? this.afterWorkFeeling,
      enjoyingTheMorning: enjoyingTheMorning ?? this.enjoyingTheMorning,
      newReleaseAlbums: newReleaseAlbums ?? this.newReleaseAlbums,
      topMusics: topMusics ?? this.topMusics,
      topArtist: topArtist ?? this.topArtist,
      trendingMusic: trendingMusic ?? this.trendingMusic,
    );
  }
}

final class HomeScreenError extends HomeScreenState {
  final String error;
  HomeScreenError({required this.error});
}
