import 'package:hive_flutter/hive_flutter.dart';
import 'package:musicapp/enums/model_type.dart';
import 'package:musicapp/models/main_model.dart';

class BasicMusicModel extends MainModel {
  BasicMusicModel(
      {required super.id,
      required super.title,
      required super.thumbnail,
      required this.author})
      : super();
  String author;
  @override
  ModelType get type => ModelType.video;
}
