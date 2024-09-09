import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/models/music_model.dart';

///Customise the [ApiService] for the [MusicModel]
class MusicApiService extends ApiService {
  ///get [MusicModel] detailed data from the api
  Future<Map<String, dynamic>> getMusicMapData(String id) async =>
      await getResponseJson(ApiConstantsRequest.musicInfo,
          queryParameters: {"id": id});
}
