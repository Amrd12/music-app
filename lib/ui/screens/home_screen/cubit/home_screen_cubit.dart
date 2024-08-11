import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/repo/music_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final MusicRepo _musicRepo = MusicRepo();

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

    emit(HomeScreenSuccess(musicList));
  }
}
