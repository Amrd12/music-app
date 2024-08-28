import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/player_full_screen/view/music_full_screen.dart';

import '../../widgets/player_widget.dart';

class PlayerMiniScreen extends StatelessWidget {
  const PlayerMiniScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MusicModel? model;
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.currentPlaylist[state.index];
        }
        return (model != null)
            ? GestureDetector(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MusicFullScreen()));
                },
                child: PlayerWidget(model: model as MusicModel))
            : const SizedBox.shrink();
      },
    );
  }
}
