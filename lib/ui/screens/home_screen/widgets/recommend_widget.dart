import 'package:flutter/material.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/platlist_screen/view/playlist_screen.dart';
import '../../../../constans/text_style_manager.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({super.key, required this.model});
  final PlaylistModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 25, right: 25),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            // color: MyColors.myOrange,
            image: DecorationImage(
                image: CachedNetworkImageProvider(model.thumbnail),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(35)),
        child: Text(
          model.title,
          style: TextStyleManger.secTextLexend,
        ),
      ),
      IconButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CustomPushScreen(
                screen: PlaylistScreen(playlistModel: model)))),
        icon: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(.7),
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.play_arrow, size: 30)),
      ),
    ]);
  }
}
