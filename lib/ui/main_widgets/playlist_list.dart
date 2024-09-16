
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/platlist_screen/view/playlist_screen.dart';

class PlaylistList extends StatelessWidget {
  const PlaylistList({super.key, required this.modelList, this.scroll});
  final List<PlaylistModel> modelList;
  final ScrollController? scroll;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      controller: scroll,
      itemBuilder: (context, index) {
        final model = modelList[index];
        return ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CustomPushScreen(
                  screen: PlaylistScreen(playlistModel: model)))),
          leading: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomPhoto(imageUrl: model.thumbnail, radius: 100),
          ),
          title: Text(
            model.title,
            maxLines: 1, // Ensures the title is only one line
            overflow: TextOverflow.ellipsis, // Adds ellipsis if overflow
            style: TextStyleManger.mainTextNico
                .copyWith(fontSize: 18, color: MyColors.myOrange),
          ),
          minLeadingWidth: 20,
          subtitle: Text(
            model.playlistAuthor ?? model.subtitle ?? "",
            maxLines: 1, // Ensures the subtitle is only one line
            overflow: TextOverflow.ellipsis, // Adds ellipsis if overflow
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            style: TextStyleManger.secTextLexendWhite
                .copyWith(fontSize: 15, color: MyColors.myWhite),
          ),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        );
      },
    );
  }
}
