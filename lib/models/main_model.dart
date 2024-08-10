import 'package:musicapp/enums/model_type.dart';
import 'package:musicapp/models/basic_models/basic_music_model.dart';
import 'package:musicapp/models/model_info/info_music_model.dart';

abstract class MainModel {
  final String id;
  final String title;
  final String thumbnail;
  ModelType get type;
  MainModel({required this.id, required this.title, required this.thumbnail});
}

void main(List<String> args) {
  MainModel mo = InfoMusicModel(
      id: "421",
      title: "title",
      author: "author",
      thumbnail: "thumbnail",
      channelId: "channelId",
      seceunds: 421);
  mo = BasicMusicModel(
      id: "id", title: "title", thumbnail: "thumbnail", author: "author");
}
