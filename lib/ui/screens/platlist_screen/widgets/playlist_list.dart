import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_item.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class PlaylistList extends StatelessWidget {
  const PlaylistList(
      {super.key, required this.playlistModel, required this.scrollController});
  final PlaylistModel playlistModel;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      itemBuilder: (context, index) {
        return PlaylistItem(
            model: playlistModel.musics![index],
            onTap: () => onTap(index, context));
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: playlistModel.musics!.length,
    );
  }

  void onTap(int index, BuildContext context) =>
      BlocProvider.of<PlayerMiniCubit>(context)
          .loadPlaylist(playlistModel.musics!, startIndex: index);
}
