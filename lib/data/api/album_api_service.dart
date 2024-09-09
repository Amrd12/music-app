import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/album_model.dart';

class AlbumApiService extends ApiService {
  ///get [AlbumModel] Lyrics data from the api
  Future<Map<String, dynamic>> getPlaylistData(String id) async {
    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.albumtInfo,
        queryParameters: {"id": id, "format": "json"});
    return data;
  }
}
