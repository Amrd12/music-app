import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/services/hive_manager.dart';

class HiveMusic extends HiveManager<MusicModel> {
  @override
  String get boxName => HiveConstants.musicBox;
  
}
