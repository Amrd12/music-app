import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_widget.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({super.key, required this.artstisList});
  final List<ArtistModel> artstisList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Artists For You", style: TextStyleManger.mainTextLexend),
          const SizedBox(height: 10),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artstisList.length,
              itemBuilder: (context, index) {
                final double pding = index != artstisList.length ? 15 : 0;
                return Padding(
                  padding: EdgeInsets.only(right: pding),
                  child: ArtistWidget(model: artstisList[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
