import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class PlaylistItem extends StatelessWidget {
  const PlaylistItem(
      {super.key,
      required this.model,
      required this.islast,
      required this.index});
  final MusicModel model;
  final bool islast;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: islast == true
          ? MyColors.myGreyHeavy.withOpacity(.8)
          : Colors.transparent,
      child: ListTile(
        leading: Padding(
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
        title: Text(
          model.title,
          style: TextStyleManger.secTextLexend,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          model.author,
          style: TextStyleManger.secTextLexendgeryLighter,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        onTap: () =>
            BlocProvider.of<PlayerMiniCubit>(context).seekTOIndex(index),
      ),
    );
  }
}
