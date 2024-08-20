import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

import '../Widgets/plain_lyric_widget.dart';

class LyricScreen extends StatefulWidget {
  const LyricScreen({super.key});
  @override
  State<LyricScreen> createState() => _LyricScreenState();
}

class _LyricScreenState extends State<LyricScreen> {
  late MusicModel model;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
        builder: (context, state) {
      if (state is PlayerMiniLoad) {
        model = state.currentPlaylist[state.index];
      }
      if (model.lyrics == null) {
        return const Center(child: Text("null "));
      }

      if (model.lyrics!.isPlain) {
        return PlainLyricWidget(model: model);
      }
      return Center(child: Text("not plain"));
    });
  }
}
