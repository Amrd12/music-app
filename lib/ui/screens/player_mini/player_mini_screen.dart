import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_mini/cubit/player_mini_cubit.dart';

class PlayerMiniScreen extends StatelessWidget {
  PlayerMiniScreen({super.key});
  late MusicModel model;
  late bool visible;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.model;
        }
        if (state is PlayerMinivisible) {
          visible = state.visible;
        }
        return Container(
          width: double.maxFinite,
          child: Column(
            children: [
              ListTile(
                title: Text(model.title),
              ),
            ],
          ),
        );
      },
    );
  }
}
