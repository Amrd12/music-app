import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/lyric_screen/cubit/lyric_cubit.dart';
import 'package:musicapp/ui/screens/lyric_screen/view/lyric_screen.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class MusicBottomSheet extends StatelessWidget {
  MusicBottomSheet({super.key, required this.scrollController});

  late MusicModel model;

  final DraggableScrollableController scrollController;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: scrollController,
      initialChildSize: 0.5,
      minChildSize: 0.1,
      maxChildSize: .71,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: MyColors.myGreyHeavy,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0, backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Text(
                      "Playlist",
                      style: TextStyleManger.secTextLexendWhite,
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0, backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Text(
                      "Lyrics",
                      style: TextStyleManger.secTextLexendWhite,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController, child: LyricScreen()),
              )
            ],
          ),
        );
      },
    );
  }
}
