import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/screens/platlist_screen/cubit/playlist_cubit.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_list.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

import '../widgets/playlist_body.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({super.key, required this.playlistModel});
  PlaylistModel playlistModel;

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  PlaylistModel get model => widget.playlistModel;
  set model(PlaylistModel e) => widget.playlistModel = e;

  @override
  void initState() {
    BlocProvider.of<PlaylistCubit>(context)
        .getPlaylistInfo(widget.playlistModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistState>(
      builder: (context, state) {
        if (state is PlaylistLoad) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is PlaylistError) {
          return Center(child: Text(state.error));
        }
        {
          if (state is PlaylistSuccess) model = state.playlistModel;
        }
        return PlaylistBody(model: model);
      },
    );
  }
}
