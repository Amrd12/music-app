import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_list.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class PlaylistBody extends StatefulWidget {
  final PlaylistModel model;

  PlaylistBody({super.key, required this.model});

  @override
  _PlaylistBodyState createState() => _PlaylistBodyState();
}

class _PlaylistBodyState extends State<PlaylistBody> {
  late DraggableScrollableController scrollController;
  double height = 0.6; // Set initial height proportion

  @override
  void initState() {
    super.initState();
    scrollController = DraggableScrollableController();
    scrollController.addListener(changeSize);
  }

  @override
  void dispose() {
    scrollController.removeListener(changeSize);
    scrollController.dispose();
    super.dispose();
  }

  void changeSize() {
    setState(() {
      height = scrollController
          .size; // Update the height based on the scroll position
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CustomPlaylistPhoto should be flexible in height based on the scroll
            if (height < .8)
              Expanded(
                  child:
                      Center(child: CustomPlaylistPhoto(model: widget.model))),
            if (height >= .8)
              const SizedBox(height: 25), // Placeholder if needed
              
            SizedBox(
              height: height * MediaQuery.of(context).size.height,
              child: CustomBottomSheet(
                scrollController: scrollController,
                maxSize: .8,
                minSize: 0.5,
                initSize: height,
                bgcolor: MyColors.myGreyLight.withOpacity(.5),
                builder: (context, scrollController) => PlaylistList(
                  playlistModel: widget.model,
                  scrollController: scrollController,
                ),
              ),
            ),
          ],
        ),
        // Back button or any overlay elements
      ],
    );
  }
}

class CustomPlaylistPhoto extends StatelessWidget {
  const CustomPlaylistPhoto({
    super.key,
    required this.model,
  });

  final PlaylistModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomPhoto(
          imageUrl: model.thumbnail,
          radius: 50.0,
          margain: 15.0,
        ),
        IconButton(
          onPressed: () async => await BlocProvider.of<PlayerMiniCubit>(context)
              .loadPlaylist(model.musics!),
          icon: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(.7),
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.play_arrow, size: 40),
          ),
        ),
      ],
    );
  }
}
