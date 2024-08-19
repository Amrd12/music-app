import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/playlist_screen/widgets/playlist_item.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});
  List<MusicModel> playlist = [];
  int? currentmusic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          playlist = state.currentPlaylist;
          currentmusic = state.index;
        }

        if (playlist.isEmpty || currentmusic == null) {
          return Center(child: Text("Nothing played"));
        }

        return ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => PlaylistItem(
            key: ValueKey(index),
            model: playlist[index],
            islast: currentmusic == index,
            index: index,
          ),
          itemCount: playlist.length,
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) newIndex--;
            BlocProvider.of<PlayerMiniCubit>(context)
                .onReorder(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
