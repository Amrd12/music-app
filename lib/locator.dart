import 'package:get_it/get_it.dart';
import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/services/database/Hive_music.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerFactory<MusicApiService>(() => MusicApiService());
  locator.registerFactory<MusicRepo>(() => MusicRepo());
  locator.registerFactory<HiveMusic>(() => HiveMusic());
  locator.registerLazySingleton<AudioPlayerHandler>(() => AudioPlayerHandler());
}
