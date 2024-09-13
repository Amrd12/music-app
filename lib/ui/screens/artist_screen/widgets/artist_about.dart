import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';

class ArtistAbout extends StatelessWidget {
  const ArtistAbout({super.key, required this.about, required this.controller});
  final String about;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        about,
        textAlign: TextAlign.center,
        style: TextStyleManger.mainTextLexend.copyWith(fontSize: 15),
      ),
    );
  }
}
