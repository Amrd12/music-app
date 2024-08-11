import 'package:get_it/get_it.dart';
import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/services/Hive_music.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<MusicApiService>(() => MusicApiService());
  locator.registerLazySingleton<MusicRepo>(() => MusicRepo());
  locator.registerLazySingleton<HiveMusic>(() => HiveMusic());
  locator.registerLazySingleton<MusicApiService>(() => MusicApiService());
}
