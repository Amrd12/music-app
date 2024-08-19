import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/player_full_screen/view/music_full_screen.dart';

import '../../widgets/player_widget.dart';

class PlayerMiniScreen extends StatelessWidget {
  PlayerMiniScreen({super.key, this.visible = false});
  MusicModel? model;
  bool visible;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.currentPlaylist[state.index];
          print(model!.title);
          visible = state.visible;
        }
        return (visible && model != null)
            ? GestureDetector(
                onTap: () async {
                  BlocProvider.of<PlayerMiniCubit>(context).visible(false);

                  await Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MusicFullScreen()));
                },
                child: player_widget(model: model as MusicModel))
            : const SizedBox.shrink();
      },
    );
  }
}
