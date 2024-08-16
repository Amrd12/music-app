import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/Lyric_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/lyric_screen/cubit/lyric_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class LyricScreen extends StatefulWidget {
  const LyricScreen({super.key});
  @override
  State<LyricScreen> createState() => _LyricScreenState();
}

class _LyricScreenState extends State<LyricScreen> {
  late MusicModel model;
  @override
  void initState() {
    print("=========================================================");
    // BlocProvider.of<LyricCubit>(context).getLyric(widget.);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.model;
          if (model.lyrics == null) {
            print(
                "lyrics =============================================================");
            BlocProvider.of<LyricCubit>(context).getLyric(model.id);
          }
        }

        return BlocBuilder<LyricCubit, LyricState>(
          builder: (context, state) {
            if (state is LyricSuccess) model.lyrics = state.lyricModel;
            if (state is LyricLoading || model.lyrics == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (model.lyrics!.isPlain) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    textAlign: TextAlign.center,
                    model.lyrics!.plainText!,
                    style: TextStyleManger.mainTextLexend,
                  ));
            }
            return Container();
          },
        );
      },
    );
  }
}
