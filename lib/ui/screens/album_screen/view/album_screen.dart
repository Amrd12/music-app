import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/screens/album_screen/cubit/album_cubit.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/album_body.dart';


class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key, required this.playlistModel});
  final AlbumModel playlistModel;

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late AlbumModel model = widget.playlistModel;

  @override
  void initState() {
    BlocProvider.of<AlbumCubit>(context)
        .getPlaylistInfo(widget.playlistModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        if (state is AlbumLoad) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AlbumError) {
          return Center(child: Text(state.error));
        }
        {
          if (state is AlbumSuccess) model = state.albumModel;
        }

        return AlbumBody(model: model);
      },
    );
  }
}
