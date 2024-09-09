import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/artist_model.dart';

class ArtistApiService extends ApiService {
  ///get [ArtistModel] Lyrics data from the api
  Future<Map<String, dynamic>> getPlaylistData(String id) async {
    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.artistInfo,
        queryParameters: {"id": id, "format": "json"});
    return data;
  }
}
