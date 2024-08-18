import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/lyric_screen/view/lyric_screen.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/playlist_screen/view/playlist_screen.dart';

import 'bottom_sheet_layout.dart';

class MusicBottomSheet extends StatelessWidget {
  MusicBottomSheet({super.key, required this.scrollController});

  final DraggableScrollableController scrollController;

  late MusicModel model;

  @override
  Widget build(BuildContext context) {
    final Color color = MyColors.myGreyHeavy.withOpacity(.4);
    return DraggableScrollableSheet(
      controller: scrollController,
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: .71,
      expand: true,
      builder: (context, scrollController) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: BottomSheetLayout(scrollcontroller: scrollController));
      },
    );
  }
}
