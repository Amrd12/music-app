part of 'home_screen_cubit.dart';

sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenSuccess extends HomeScreenState {
  final List<MusicModel>? quickPicks;
  final List<PlaylistModel>? boostYourMood;
  final List<PlaylistModel>? summer_2024;
  final List<PlaylistModel>? afterWorkFeeling;

  HomeScreenSuccess(this.quickPicks, this.boostYourMood, this.summer_2024,
      this.afterWorkFeeling);
}

final class HomeScreenError extends HomeScreenState {
  final String error;
  HomeScreenError({required this.error});
}
