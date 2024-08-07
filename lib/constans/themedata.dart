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

  primaryTextTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 30, fontFamily: "NicoMogi"),
    bodyMedium: TextStyle(fontSize: 30, fontFamily: "LexendExa"),
    titleLarge: TextStyle(fontSize: 25, fontFamily: "NicoMogi"),
    titleMedium: TextStyle(
        fontSize: 20, fontFamily: "LexendExa", color: MyColors.myGreyLight),
    labelLarge: TextStyle(fontSize: 10, fontFamily: "NicoMogi"),
    labelMedium: TextStyle(fontSize: 10, fontFamily: "LexendExa"),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.myGreyHeavy.withOpacity(.1),
      selectedItemColor: MyColors.myOrange),
);
