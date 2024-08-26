import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/play_pause_button.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/song_progress.dart';

import 'player_model_data_widget.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget(
      {super.key,
      required this.model,
      this.bgColor = MyColors.myGreyLight,
      this.showPhoto = true});
  final Color bgColor;
  final MusicModel model;
  final bool showPhoto;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor.withOpacity(.5),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PlayerModelDataWidget(model: model, showPhoto: showPhoto),
            PlayPauseButton(),
            SongProgress(
                totalDuration:
                    Duration(seconds: model.seceunds!.round().toInt()))
          ],
        ),
      ),
    );
  }
}
