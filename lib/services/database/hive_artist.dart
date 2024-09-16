import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveArtist extends HiveManager<ArtistModel> {
  @override
  String get boxName => HiveConstants.artistBox;
}
