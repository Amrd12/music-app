import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/music_model.dart';

//TODO get lyrices(synced or plain) , music data , download music

///Customise the [ApiService] for the [MusicModel]
class MusicApiService extends ApiService {
  ///get [MusicModel] detailed data from the api
  Future<Map<String, dynamic>> getMusicMapData(String id) async =>
      await getResponseJson(ApiConstantsRequest.musicInfo,
          queryParameters: {"id": id});

  ///get [MusicModel] Lyrics data from the api
  Future<Map<String, dynamic>> getMusicMapLyrics(String id) async {
    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.lyricsSynced,
        queryParameters: {"id": id, "format": "json"});
    data = (data.isEmpty || data["error"] != null)
        ? await getResponseJson(ApiConstantsRequest.lyricsPlain,
            queryParameters: {"id": id, "format": "json"})
        : data;
    return data;
  }
  
}
