import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/artist_screen/view/artist_screen.dart';

class PlayerPhotoFull extends StatelessWidget {
  const PlayerPhotoFull({
    super.key,
    required this.model,
  });

  final MusicModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CustomPushScreen(
                    screen: ArtistScreen(
                  model: ArtistModel(
                      channelId: model.channelId!,
                      title: model.author,
                      thumbnail: '',
                      subscriberText: ''),
                )))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipPath(
            clipBehavior: Clip.hardEdge,
            clipper: _CustomClipperExample(),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: model.thumbnail.last,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomClipperExample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .95);
    path.quadraticBezierTo(
      size.width * .45,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_CustomClipperExample oldClipper) => false;
}
