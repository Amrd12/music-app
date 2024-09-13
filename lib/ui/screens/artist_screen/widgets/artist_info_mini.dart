import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';

class ArtistInfoMini extends StatelessWidget {
  const ArtistInfoMini({super.key, required this.model, required this.height});
  final ArtistModel model;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomPhoto(imageUrl: model.thumbnail, radius: 100)),
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          model.title,
          style: TextStyleManger.mainTextNico
              .copyWith(fontSize: 20, color: MyColors.myOrange),
        ),
        subtitle: Text(
          "Followers ${model.subscriberText}",
          style: TextStyleManger.secTextLexendWhite.copyWith(fontSize: 15),
        ),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
      ),
    );
  }
}
