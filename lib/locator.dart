import 'package:get_it/get_it.dart';
import 'package:musicapp/data/api/album_api_service.dart';
import 'package:musicapp/data/api/artist_api_service.dart';
import 'package:musicapp/data/api/lyrics_api_service.dart';
import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/api/playlist_api_service.dart';
import 'package:musicapp/data/api/search_api_service.dart';
import 'package:musicapp/data/repo/album_repo.dart';
import 'package:musicapp/data/repo/artist_repo.dart';
import 'package:musicapp/data/repo/lyrics_repo.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/data/repo/playlist_repo.dart';
import 'package:musicapp/data/repo/search_repo.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/services/database/hive_album.dart';
import 'package:musicapp/services/database/hive_artist.dart';
import 'package:musicapp/services/database/hive_lyrics.dart';
import 'package:musicapp/services/database/hive_music.dart';
import 'package:musicapp/services/database/hive_playlist.dart';
import 'package:musicapp/services/database/hive_search.dart';
import 'package:musicapp/services/database/hive_user.dart';

final locator = GetIt.instance;

void setup() {
  //api
  locator.registerFactory<MusicApiService>(() => MusicApiService());
  locator.registerFactory<LyricsApiService>(() => LyricsApiService());
  locator.registerFactory<PlaylistApiService>(() => PlaylistApiService());
  locator.registerFactory<AlbumApiService>(() => AlbumApiService());
  locator.registerFactory<ArtistApiService>(() => ArtistApiService());
  locator.registerFactory<SearchApiService>(() => SearchApiService());

  //repo
  locator.registerFactory<MusicRepo>(() => MusicRepo());
  locator.registerFactory<LyricsRepo>(() => LyricsRepo());
  locator.registerFactory<SearchRepo>(() => SearchRepo());
  locator.registerFactory<PlaylistRepo>(() => PlaylistRepo());
  locator.registerFactory<AlbumRepo>(() => AlbumRepo());
  locator.registerFactory<ArtistRepo>(() => ArtistRepo());

  //hive
  locator.registerFactory<HiveMusic>(() => HiveMusic());
  locator.registerFactory<HiveSearch>(() => HiveSearch());
  locator.registerFactory<HiveArtist>(() => HiveArtist());
  locator.registerFactory<HiveAlbum>(() => HiveAlbum());
  locator.registerFactory<HiveLyrics>(() => HiveLyrics());
  locator.registerFactory<HivePlaylist>(() => HivePlaylist());
  locator.registerLazySingleton<HiveUser>(() => HiveUser());

  //service
  locator.registerLazySingleton<AudioPlayerHandler>(() => AudioPlayerHandler());
}
