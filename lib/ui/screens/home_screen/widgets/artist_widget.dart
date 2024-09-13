import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/artist_screen/view/artist_screen.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({super.key, required this.model});
  final ArtistModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) =>
              CustomPushScreen(screen: ArtistScreen(model: model)))),
      child: SizedBox(
        width: 100, // Set a fixed width
        height: 100, // Set a fixed height
        child: Column(
          children: [
            CustomPhoto(imageUrl: model.thumbnail, radius: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: Colors.black54,
              child: Text(
                model.title,
                style: TextStyleManger.secTextLexend.copyWith(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
