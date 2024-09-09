import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/album_item.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class AlbumList extends StatelessWidget {
  const AlbumList(
      {super.key, required this.playlistModel, required this.scrollController});
  final AlbumModel playlistModel;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) {
        return AlbumItem(
          model: playlistModel.musics![index],
          onTap: () => onTap(index, context),
        );
      },

      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: playlistModel.musics!.length,
    );
  }

  void onTap(int index, BuildContext context) {
    BlocProvider.of<PlayerMiniCubit>(context)
        .loadPlaylist(playlistModel.musics!, startIndex: index);
  }
}
