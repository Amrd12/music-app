import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

import '../widgets/player_widget.dart';

class PlayerMiniScreen extends StatelessWidget {
  PlayerMiniScreen({super.key});
  MusicModel? model;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.model;
          print(model!.title);
          visible = state.visible;
          print(visible);
          print("model Tsec ${model!.seceunds}");
        }
        if (state is PlayerMiniSecounds && model != null) {
          model!.startFrom = state.sec;
        }
        return visible
            ? player_widget(model: model as MusicModel)
            : SizedBox.shrink();
      },
    );
  }
}
