import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/screens/platlist_screen/cubit/playlist_cubit.dart';

import '../widgets/playlist_body.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key, required this.playlistModel});
  final PlaylistModel playlistModel;

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late PlaylistModel model = widget.playlistModel;

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
          return const Center(child: CircularProgressIndicator());
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
