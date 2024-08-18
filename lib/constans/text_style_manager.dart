import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';

class TextStyleManger {
  static const TextStyle mainTextNico =
      TextStyle(fontSize: 30, fontFamily: "NicoMogi");
  static const TextStyle mainTextLexend =
      TextStyle(fontSize: 30, fontFamily: "LexendExa");
  static const TextStyle secTextNico =
      TextStyle(fontSize: 20, fontFamily: "NicoMogi");
  static const TextStyle secTextLexend =
      TextStyle(fontSize: 20, fontFamily: "LexendExa");
  static const TextStyle secTextLexendWhite =
      TextStyle(fontSize: 20, fontFamily: "LexendExa", color: MyColors.myWhite);
  static const TextStyle secTextLexendgery = TextStyle(
      fontSize: 20, fontFamily: "LexendExa", color: MyColors.myGreyLight);
  static const TextStyle secTextLexendgeryLighter = TextStyle(
      fontSize: 20,
      fontFamily: "LexendExa",
      color: Color.fromARGB(255, 212, 211, 211));
}
