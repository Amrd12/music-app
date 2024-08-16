import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/data/models/Lyric_model.dart';
import 'package:musicapp/data/repo/lyrics_repo.dart';
import 'package:musicapp/locator.dart';

part 'lyric_state.dart';

class LyricCubit extends Cubit<LyricState> {
  LyricCubit() : super(LyricInitial());
  LyricsRepo repo = locator.get<LyricsRepo>();

  void getLyric(String id) async {
    emit(LyricLoading());
    final lyric = await repo.getLyric(id);
    emit(LyricSuccess(lyric));
  }
}
