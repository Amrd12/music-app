import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/lyric_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveLyrics extends HiveManager<LyricsModel> {
  @override
  String get boxName => HiveConstants.lyricstBox;
}
