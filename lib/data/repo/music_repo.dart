import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/models/music_model.dart';

class MusicRepo {
  final MusicApiService _musicApiService = MusicApiService();

  List<MusicModel> parseMusicModel(List<Map<String, dynamic>> map) =>
      List<MusicModel>.from(map.map((i) => MusicModel.fromMap(i))).toList();

  Future<MusicModel> getMusicData(MusicModel model) async {
    final data = await _musicApiService.getMusicMapData(model.id);
    String? channelId;
    List<String>? thumbnails;
    int? sec;
    if (!model.isDetailed) {
      channelId = data["videoDetails"]["channelId"];
      thumbnails = List<String>.from(data["videoDetails"]["thumbnail"]
              ["thumbnails"]
          .map((i) => i["url"].toString()));
      sec = int.tryParse(data["videoDetails"]["lengthSeconds"].toString())!;
      model.isDetailed = true;
      if (model.isInBox) model.save();
    }
    model.formates = [];
    for (var element in data["streamingData"]["adaptiveFormats"]) {
      if (element["audioQuality"] != null) {
        model.formates!.add({
          element["audioQuality"].toString().split("_").last:
              element["url"].toString()
        });
      }
    }
    return model.copyWith(
        channelId: channelId,
        thumbnail: thumbnails,
        seceunds: sec,
        formates: model.formates);
  }
}
