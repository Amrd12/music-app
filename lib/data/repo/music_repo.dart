import 'package:flutter/material.dart';
import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/locator.dart';

class MusicRepo {
  final MusicApiService _musicApiService = locator.get<MusicApiService>();

  List<MusicModel> parseMusicModel(List<Map<String, dynamic>> map) =>
      List<MusicModel>.from(map.map((i) => MusicModel.fromMap(i))).toList();

  Future<MusicModel> getMusicData(MusicModel model) async {
    final data = await _musicApiService.getMusicMapData(model.id);
    String? channelId;
    List<String>? thumbnails;
    double? sec;
    if (!model.isDetailed) {
      channelId = data["videoDetails"]["channelId"];
      thumbnails = List<String>.from(data["videoDetails"]["thumbnail"]
              ["thumbnails"]
          .map((i) => i["url"].toString()));
      sec = double.tryParse(data["videoDetails"]["lengthSeconds"].toString())!;
      debugPrint("Music total Sec : $sec");
      model.seceunds = sec;
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
    return model;
  }
}
