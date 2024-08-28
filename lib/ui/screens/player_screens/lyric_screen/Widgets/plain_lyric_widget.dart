import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';

class PlainLyricWidget extends StatelessWidget {
  const PlainLyricWidget({
    super.key,
    required this.model,
  });

  final MusicModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          textAlign: TextAlign.center,
          model.lyrics!.plainText!,
          style: TextStyleManger.mainTextLexend.copyWith(fontSize: 25),
        ));
  }
}
