import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({super.key, required this.name, required this.picLink});
  final String name, picLink;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColors.myOrange),
            clipBehavior: Clip.hardEdge,
            child: Image.network(picLink, fit: BoxFit.cover)),
        // SizedBox(height: 10),
        Text(name, style: TextStyleManger.secTextLexend)
      ],
    );
  }
}
