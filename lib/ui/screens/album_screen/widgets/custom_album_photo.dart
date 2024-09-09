import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

class CustomAlbumPhoto extends StatelessWidget {
  const CustomAlbumPhoto({
    super.key,
    required this.model,
  });

  final AlbumModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ClipPath(
            clipBehavior: Clip.hardEdge,
            clipper: _CustomClipperExample(),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model.thumbnail,
            ),
          ),
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

class _CustomClipperExample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 20.0;

    // Move to the top-left corner with a curve
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Line to the top-right corner with a curve
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Line to the bottom-right corner with a curve
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    // Line to the bottom-left corner with a curve
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_CustomClipperExample oldClipper) => false;
}
