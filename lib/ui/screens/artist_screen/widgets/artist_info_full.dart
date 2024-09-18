import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';

class ArtistInfoFull extends StatelessWidget {
  const ArtistInfoFull({super.key, required this.model, required this.height});
  final ArtistModel model;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                flex: 3,
                child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child:
                        CustomPhoto(imageUrl: model.thumbnail, radius: 100))),
            Flexible(
              child: FittedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  model.title,
                  maxLines: 5,
                  style: TextStyleManger.mainTextNico
                      .copyWith(fontSize: 20, color: MyColors.myOrange),
                ),
              ),
            ),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Followers ${model.subscriberText}",
                  style:
                      TextStyleManger.secTextLexendWhite.copyWith(fontSize: 10),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      model.isInBox == true
                          ? Icons.favorite
                          : Icons.heart_broken_outlined,
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
