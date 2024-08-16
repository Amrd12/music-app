import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/player_full_screen/view/music_full_screen.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/play_pause_button.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/song_progress.dart';

import 'player_model_data_widget.dart';

class player_widget extends StatelessWidget {
  const player_widget(
      {super.key,
      required this.model,
      this.bgColor = MyColors.myGreyLight,
      this.showPhoto = true});
  final Color bgColor;
  final MusicModel model;
  final bool showPhoto;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        BlocProvider.of<PlayerMiniCubit>(context).visible(false);

        await Navigator.push(
            context, MaterialPageRoute(builder: (_) => MusicFullScreen()));
      },
      child: Card(
        color: bgColor.withOpacity(.5),
        child: Container(
          padding: EdgeInsets.all(10),
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
      ),
    );
  }
}
