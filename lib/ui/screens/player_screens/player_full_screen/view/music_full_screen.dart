import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/play_pause_button.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/player_model_data_widget.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/player_widget.dart';
import 'package:musicapp/ui/screens/player_screens/widgets/song_progress.dart';

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
      scrollController.jumpTo(.3);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final playerMiniCubit = BlocProvider.of<PlayerMiniCubit>(context);
    playerMiniCubit.visible(true);
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
        if (state is PlayerMiniLoad) model = state.currentPlaylist[state.index];
        return model == null
            ? const SizedBox.shrink()
            : Scaffold(
                body: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (height <= .7) PlayerPhotoFull(model: model),
                        if (height >= .7) const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: player_widget(
                            showPhoto: false,
                            model: model!,
                            bgColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                            height: height * MediaQuery.of(context).size.height)
                      ],
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new, size: 40)),
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
