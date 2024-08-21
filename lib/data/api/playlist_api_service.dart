import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';

class PlaylistApiService extends ApiService {
  ///get [PlaylistModel] Lyrics data from the api
  Future<Map<String, dynamic>> getPlaylistData(String id) async {
    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.playlistInfo,
        queryParameters: {"id": id, "format": "json"});
    return data;
  }
}
