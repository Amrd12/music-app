import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/play_pause_button.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/song_progress.dart';

import 'player_model_data_widget.dart';

class player_widget extends StatelessWidget {
  const player_widget({
    super.key,
    required this.model,
  });

  final MusicModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: MyColors.myGreyHeavy,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: double.maxFinite,
        child: Column(
          children: [
            PlayerModelDataWidget(model: model),
            ListTile(
                title: SongProgress(
                    totalDuration:
                        Duration(seconds: model.seceunds!.round().toInt())),
                subtitle: PlayPauseButton())
          ],
        ));
  }
}
