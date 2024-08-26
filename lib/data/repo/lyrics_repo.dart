import 'package:musicapp/data/api/lyrics_api_service.dart';
import 'package:musicapp/data/models/lyric_model.dart';
import 'package:musicapp/locator.dart';

class LyricsRepo {
  LyricsApiService lyricsApiService = locator.get<LyricsApiService>();
  LyricsModel parseLyrics(Map<String, dynamic> map) => LyricsModel.fromMap(map);

  Future<LyricsModel> getLyric(String id) async {
    final data = await lyricsApiService.getMusicMapLyrics(id);
    if (data["isPlain"]) {
      return LyricsModel(
          isPlain: true, plainText: data["description"]["text"]);
    } else {
      return LyricsModel(isPlain: false, text: data["results"]);
    }
  }
}
