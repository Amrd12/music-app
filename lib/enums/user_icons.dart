import 'package:musicapp/constans/user_icons_svg';

enum UserIcons {
  userIcon1,
  userIcon2,
  userIcon3,
  userIcon4,
  userIcon5,
  userIcon6,
  userIcon7,
  userIcon8,
  userIcon9;

  // Override the toString method
  @override
  String toString() {
    switch (this) {
      case UserIcons.userIcon1:
        return 'userIcon1';
      case UserIcons.userIcon2:
        return 'userIcon2';
      case UserIcons.userIcon3:
        return 'userIcon3';
      case UserIcons.userIcon4:
        return 'userIcon4';
      case UserIcons.userIcon5:
        return 'userIcon5';
      case UserIcons.userIcon6:
        return 'userIcon6';
      case UserIcons.userIcon7:
        return 'userIcon7';
      case UserIcons.userIcon8:
        return 'userIcon8';
      case UserIcons.userIcon9:
        return 'userIcon9';
      default:
        return '';
    }
  }

  // Method to get the path of each icon
  String get path {
    switch (this) {
      case UserIcons.userIcon1:
        return UserIconsSvg.userIcon1;
      case UserIcons.userIcon2:
        return UserIconsSvg.userIcon2;
      case UserIcons.userIcon3:
        return UserIconsSvg.userIcon3;
      case UserIcons.userIcon4:
        return UserIconsSvg.userIcon4;
      case UserIcons.userIcon5:
        return UserIconsSvg.userIcon5;
      case UserIcons.userIcon6:
        return UserIconsSvg.userIcon6;
      case UserIcons.userIcon7:
        return UserIconsSvg.userIcon7;
      case UserIcons.userIcon8:
        return UserIconsSvg.userIcon8;
      case UserIcons.userIcon9:
        return UserIconsSvg.userIcon9;
      default:
        return '';
    }
  }
}

extension ToUserIcons on String {
  UserIcons? toUserIcon() {
    switch (this) {
      case "userIcon1":
        return UserIcons.userIcon1;
      case "userIcon2":
        return UserIcons.userIcon2;
      case "userIcon3":
        return UserIcons.userIcon3;
      case "userIcon4":
        return UserIcons.userIcon4;
      case "userIcon5":
        return UserIcons.userIcon5;
      case "userIcon6":
        return UserIcons.userIcon6;
      case "userIcon7":
        return UserIcons.userIcon7;
      case "userIcon8":
        return UserIcons.userIcon8;
      case "userIcon9":
        return UserIcons.userIcon9;
      default:
        return null;
    }
  }
}
