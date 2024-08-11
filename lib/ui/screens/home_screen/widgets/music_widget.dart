import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';

class MusicWidget extends StatelessWidget {
  const MusicWidget({super.key, required this.model});
  final MusicModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 40),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MyColors.myOrange),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                      imageUrl: model.thumbnail.first, fit: BoxFit.cover)),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(.7),
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: const Icon(Icons.play_arrow, size: 40)),
              ),
            ],
          ),
          const SizedBox(width: 10), // Add some spacing
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyleManger.secTextLexend,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                ),
                Text(model.author, style: TextStyleManger.secTextLexendgery)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
