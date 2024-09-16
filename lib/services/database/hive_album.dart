import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveAlbum extends HiveManager<AlbumModel> {
  @override
  String get boxName => HiveConstants.albumBox;
}
