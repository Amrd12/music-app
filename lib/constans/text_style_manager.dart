import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';

class TextStyleManger {
  final ThemeMode theme;

  TextStyleManger(BuildContext context)
      : theme = Theme.of(context).brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;

  // Use non-constant styles so they can be dynamically set based on the theme
  TextStyle get mainTextNico => TextStyle(
      fontSize: 30,
      fontFamily: "NicoMogi",
      color: theme == ThemeMode.dark ? MyColors.myWhite : MyColors.myBlack);

  TextStyle get mainTextLexend =>
      const TextStyle(fontSize: 30, fontFamily: "LexendExa" ,);

  TextStyle get secTextNico =>
      const TextStyle(fontSize: 20, fontFamily: "NicoMogi");

  TextStyle get secTextLexend =>
      const TextStyle(fontSize: 20, fontFamily: "LexendExa");

  TextStyle get secTextLexendGrey => const TextStyle(
      fontSize: 20, fontFamily: "LexendExa", color: MyColors.myGreyLight);
}
