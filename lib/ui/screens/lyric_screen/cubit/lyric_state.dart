part of 'lyric_cubit.dart';

@immutable
sealed class LyricState {}

final class LyricInitial extends LyricState {}

final class LyricLoading extends LyricState {}

final class LyricSuccess extends LyricState {
  final LyricsModel lyricModel;
  LyricSuccess(this.lyricModel);
}
