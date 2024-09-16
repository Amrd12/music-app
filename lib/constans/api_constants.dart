class ApiConstantsRequest {
  static const String baseUrl = "https://youtube-music-api3.p.rapidapi.com/";
  static const String home = "v2/home";
  static const String musicInfo = "info";
  static const String search = "search";
  static const String lyricsSynced = "music/lyrics/synced";
  static const String lyricsPlain = "music/lyrics/plain";

  static const String next = "next";
  static const String playlistInfo = "getPlaylist";
  static const String artistInfo = "getArtists";
  static const String albumtInfo = "getAlbum";
}

class ApiConstantsResponse {
  static const String quickhomeVidoes = "quick_picks";
  static const String quickhomePlaylists = "music_this_year";
  static const String quickhomealbums = "new_release_albums";
  static const String charts = "charts";
  static const String chartsVideos = "top_music_video";
  static const String chartsArtist = "top_artist";
}
