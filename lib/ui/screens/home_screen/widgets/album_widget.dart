import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/album_screen/view/album_screen.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import '../../../../constans/text_style_manager.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({super.key, required this.model, this.showText = false});
  final AlbumModel model;
  final bool showText;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                CustomPushScreen(screen: AlbumScreen(model: model)))),
        child: Container(
          width: 200,
          margin: const EdgeInsets.only(bottom: 25, right: 25),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              // color: MyColors.myOrange,
              image: DecorationImage(
                  image: CachedNetworkImageProvider(model.thumbnail),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(35)),
          child: showText == true
              ? Text(
                  model.title,
                  style: TextStyleManger.secTextLexend,
                )
              : null,
        ),
      ),
      IconButton(
        onPressed: () => BlocProvider.of<PlayerMiniCubit>(context)
            .loadPlaylist(model.musics!),
        icon: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(.7),
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.play_arrow, size: 30)),
      ),
    ]);
  }
}
