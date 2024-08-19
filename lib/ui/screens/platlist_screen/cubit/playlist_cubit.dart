import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistInitial());
}
