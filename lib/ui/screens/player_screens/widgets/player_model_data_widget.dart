import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';

class PlayerModelDataWidget extends StatelessWidget {
  const PlayerModelDataWidget(
      {super.key, required this.model, this.showPhoto = true});
  final bool showPhoto;
  final MusicModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showPhoto)
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.myOrange,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: model.thumbnail.first,
                    fit: BoxFit.cover,
                  ),
                )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Text(
                    model.title,
                    style: TextStyleManger.secTextLexend,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                    model.author,
                    style: TextStyleManger.secTextLexendgery,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  model.isInBox == true
                      ? Icons.favorite
                      : Icons.heart_broken_outlined,
                ),
                onPressed: () {},
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          )
        ],
      ),
    );
  }
}
