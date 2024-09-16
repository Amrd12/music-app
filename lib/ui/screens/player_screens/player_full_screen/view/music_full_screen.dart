import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/player_widget.dart';

import '../widgets/music_bottom_sheet.dart';
import '../widgets/player_photo_full.dart';

class MusicFullScreen extends StatefulWidget {
  const MusicFullScreen({super.key});

  @override
  State<MusicFullScreen> createState() => _MusicFullScreenState();
}

class _MusicFullScreenState extends State<MusicFullScreen> {
  MusicModel? model;
  late DraggableScrollableController scrollController;
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController = DraggableScrollableController();
    scrollController.addListener(changeSize);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(.08);
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(changeSize);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.currentPlaylist[state.index];
        }

        return model == null
            ? const SizedBox.shrink()
            : Scaffold(
                body: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (height < 0.65) PlayerPhotoFull(model: model!),
                        if (height >= 0.65) const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: PlayerWidget(
                            showPhoto: false,
                            model: model!,
                            bgColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                            height:
                                height * MediaQuery.of(context).size.height),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded,
                            size: 40),
                      ),
                    ),
                    MusicBottomSheet(scrollController: scrollController),
                  ],
                ),
              );
      },
    );
  }

  void changeSize() {
    setState(() {
      height = scrollController.size;
    });
  }
}
