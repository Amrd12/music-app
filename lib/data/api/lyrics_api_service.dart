import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import "package:musicapp/data/models/lyric_model.dart";

class LyricsApiService extends ApiService {
  ///get [LyricsModel] Lyrics data from the api
  Future<Map<String, dynamic>> getMusicMapLyrics(String id) async {
    bool isPlain = false;

    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.lyricsSynced,
        queryParameters: {"id": id, "format": "json"});

    if (data.isEmpty || data["error"] != null) {
      isPlain = true;
      data = await getResponseJson(ApiConstantsRequest.lyricsPlain,
          queryParameters: {"id": id, "format": "json"});
    }

    data["isPlain"] = isPlain;
    return data;
  }
}
