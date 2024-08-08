import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';

final ThemeData themedata = ThemeData(
  // useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: MyColors.myGreyHeavy,
    onPrimary: MyColors.myOrange,
    secondary: MyColors.myGreyLight,
    onSecondary: MyColors.myWhite,
    error: Colors.red,
    onError: Colors.white,
    surface: MyColors.myBlack,
    onSurface: MyColors.myWhite,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.myGreyHeavy.withOpacity(.1),
      selectedItemColor: MyColors.myOrange),
);
