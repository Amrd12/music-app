import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/locator.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final MusicRepo _musicRepo = locator.get<MusicRepo>();
  final PlaylistRepo _playlistRepo = locator.get<PlaylistRepo>();

  HomeScreenCubit() : super(HomeScreenInitial());

  void getPage() async {
    emit(HomeScreenLoading());
    final js = await ApiService().apiHomePage();

    if (js["error"] != null) {
      emit(HomeScreenError(error: js["error"]));
      return;
    }

    List<Map<String, dynamic>> musicJsList = List<Map<String, dynamic>>.from(
        js["results"][ApiConstantsResponse.quickhomeVidoes]);

    final musicList = _musicRepo.parseMusicModel(musicJsList);

    List<PlaylistModel>? boost_your_mood =
        _parsePlayList(js["results"]["boost_your_mood"]);

    List<PlaylistModel>? after_work_feeling =
        _parsePlayList(js["results"]["after_work_feeling"]);

    List<PlaylistModel>? summer_2024 =
        _parsePlayList(js["results"]["summer_2024_☀️🌴🍉"]);

    emit(HomeScreenSuccess(
        musicList, boost_your_mood, summer_2024, after_work_feeling));
  }

  List<PlaylistModel>? _parsePlayList(List<dynamic>? js) {
    if (js == null) return null;
    List<Map<String, dynamic>> Playlistmoods =
        List<Map<String, dynamic>>.from(js);

    Playlistmoods.map((e) => e["id"] = e.remove("browseId")).toList();

    List<PlaylistModel> boost_your_mood = List<PlaylistModel>.from(
        _playlistRepo.parsePlaylistModel(Playlistmoods));
    return boost_your_mood;
  }
}
