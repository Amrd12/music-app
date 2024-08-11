part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenSuccess extends HomeScreenState {
  final List<MusicModel> musicModel;
  HomeScreenSuccess(this.musicModel);
}

final class HomeScreenError extends HomeScreenState {
  final String error;

  HomeScreenError({required this.error});
}
