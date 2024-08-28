import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/current_playlist_screen/widgets/current_playlist_item.dart';

class CurrentPlaylistScreen extends StatelessWidget {
  const CurrentPlaylistScreen({super.key});

  @override

  Widget build(BuildContext context) {
    List<MusicModel> playlist = [];
    MusicModel? currentmusic;
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          playlist = state.currentPlaylist;
          currentmusic = playlist[state.index];
        }

        if (playlist.isEmpty || currentmusic == null) {
          return const Center(child: Text("Nothing played"));
        }

        int currentIndex = playlist.indexWhere((test) => test == currentmusic);

        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CurrentPlaylistItem(
            model: playlist[index],
            isPlaying: index == currentIndex,
            index: index,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10.0),
          itemCount: playlist.length,
        );
      },
    );
  }
}

