import 'dart:developer';

import 'package:musicapp/constans/hive_constants.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/services/database/hive_manager.dart';

class HiveUser extends HiveManager<UserModel> {
  @override
  String get boxName => HiveConstants.userBox;

  UserModel? get userModel => box.get(HiveConstants.userBox);

  bool get islogin => userModel != null;

  void setup() {
    log(userModel.toString());
  }

  Future<void> setUser(UserModel user) async {
    if (!user.isInBox) await box.put(HiveConstants.userBox, user);
    await user.save();
  }

  Future<void> delUser() async {
    await userModel!.delete();
  }
}
