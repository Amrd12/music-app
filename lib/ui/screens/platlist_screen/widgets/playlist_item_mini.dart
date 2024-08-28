import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';

class PlaylistItemMini extends StatelessWidget {
  const PlaylistItemMini({super.key, required this.model});
  final PlaylistModel model;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: CustomPhoto(imageUrl: model.thumbnail, radius: 20),
        title: Text(
          model.title,
          style: TextStyleManger.mainTextLexend
              .copyWith(color: MyColors.myOrange, fontSize: 20),
        ),
        subtitle: Text(
          model.playlistAuthor ?? model.subtitle,
          style: TextStyleManger.secTextLexend.copyWith(fontSize: 15),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
