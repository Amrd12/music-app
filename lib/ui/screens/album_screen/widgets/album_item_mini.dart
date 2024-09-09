import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class AlbumItemMini extends StatelessWidget {
  const AlbumItemMini({super.key, required this.model});
  final AlbumModel model;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        onTap: () => BlocProvider.of<PlayerMiniCubit>(context)
            .loadPlaylist(model.musics!),
        leading: CustomPhoto(imageUrl: model.thumbnail, radius: 20),
        title: Text(
          model.title,
          style: TextStyleManger.mainTextLexend
              .copyWith(color: MyColors.myOrange, fontSize: 20),
        ),
        subtitle: Text(
          model.albumAuthor ?? model.albumDescription,
          style: TextStyleManger.secTextLexend.copyWith(fontSize: 15),
        ),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
