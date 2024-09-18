import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/screens/platlist_screen/cubit/playlist_cubit.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/custom_playlist_photo.dart';

class PlaylistItemFull extends StatefulWidget {
  const PlaylistItemFull({super.key, required this.model, required this.size});
  final double size;
  final PlaylistModel model;

  @override
  State<PlaylistItemFull> createState() => _PlaylistItemFullState();
}

class _PlaylistItemFullState extends State<PlaylistItemFull> {
  @override
  Widget build(BuildContext context) {
    final double he = MediaQuery.of(context).size.height;
    return SizedBox(
      height: he * widget.size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: he * widget.size * .6,
              child: CustomPlaylistPhoto(model: widget.model)),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.model.title,
                  textAlign: TextAlign.center,
                  style: TextStyleManger.mainTextLexend
                      .copyWith(color: MyColors.myOrange, fontSize: 20)),
              Text(widget.model.playlistAuthor ?? "",
                  style: TextStyleManger.secTextLexend.copyWith(fontSize: 15)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top Songs"),
              IconButton(
                  onPressed: () =>
                      BlocProvider.of<PlaylistCubit>(context).add(),
                  icon: Icon(
                    widget.model.isInBox == true
                        ? Icons.favorite
                        : Icons.heart_broken_outlined,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
