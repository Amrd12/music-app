import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveUser extends HiveManager<UserModel> {
  @override
  String get boxName => HiveConstants.userBox;
  
  UserModel? userModel;

  HiveUser() {
    userModel = getAllSaved().isEmpty ? null : getAllSaved().first;
  }

  bool islogin() => getAllSaved().isEmpty;

  void setUser() {
    box.add(userModel!);
    userModel!.save();
  }
  
}
