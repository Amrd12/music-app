import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HivePlaylist extends HiveManager<PlaylistModel> {
  @override
  String get boxName => HiveConstants.playlistBox;
}
