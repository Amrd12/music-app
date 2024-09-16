import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveSearch extends HiveManager<SearchModel> {
  @override
  String get boxName => HiveConstants.searchBox;
}
