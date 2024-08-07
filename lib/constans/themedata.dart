import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';

final ThemeData themedata = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: MyColors.myGrey,
    onPrimary: MyColors.myOrange,
    secondary: MyColors.myBlack,
    onSecondary: MyColors.myWhite,
    error: Colors.red,
    onError: Colors.white,
    surface: MyColors.myBlack,
    onSurface: MyColors.myWhite,
  ),
  primaryTextTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 30, fontFamily: "NicoMogi"),
    displayMedium: TextStyle(fontSize: 30, fontFamily: "LexendExa"),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.myGrey.withOpacity(.1),
      selectedItemColor: MyColors.myOrange),
);
