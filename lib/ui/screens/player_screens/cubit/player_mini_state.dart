part of 'player_mini_cubit.dart';

@immutable
sealed class PlayerMiniState {}

final class PlayerMiniInitial extends PlayerMiniState {}

final class PlayerMiniLoad extends PlayerMiniState {
  MusicModel model;
  bool visible;
  List<MusicModel> currentPlaylist;
  PlayerMiniLoad(this.model, this.visible, this.currentPlaylist);
}

final class PlayerMiniGetFormates extends PlayerMiniState {}

final class PlayerMiniSecounds extends PlayerMiniState {
  double sec;
  PlayerMiniSecounds(this.sec);
}

final class PlayerMiniAddToBox extends PlayerMiniState {
}

final class PlayerMiniStart extends PlayerMiniState {}

final class PlayerMiniPase extends PlayerMiniState {}
