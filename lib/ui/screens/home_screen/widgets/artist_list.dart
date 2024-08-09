import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_widget.dart';

import '../../../../constans/strings.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyleManger = TextStyleManger(context);

    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Artists For You", style: textStyleManger.mainTextLexend),
          const SizedBox(height: 10),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                final double pding = index != 5 ? 10 : 0;
                return Padding(
                  padding: EdgeInsets.only(right: pding),
                  child:
                      const ArtistWidget(name: "halsey", picLink: homePicUrl),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
