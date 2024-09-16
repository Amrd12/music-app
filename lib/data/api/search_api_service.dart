import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/data/api/api_service.dart';

class SearchApiService extends ApiService {
  ///get [SearchModel] Lyrics data from the api
  Future<Map<String, dynamic>> getSearchtData(String q, String type) async {
    Map<String, dynamic> data = await getResponseJson(
        ApiConstantsRequest.search,
        queryParameters: {"q": q, "type": type});
    return data;
  }
}
