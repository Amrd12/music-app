import 'package:flutter/material.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/album_widget.dart';

import '../../../../constans/text_style_manager.dart';

class AlbumListWidget extends StatelessWidget {
  const AlbumListWidget(
      {super.key, required this.title, required this.albumList});
  final List<AlbumModel> albumList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyleManger.mainTextLexend),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albumList.length,
              itemBuilder: (context, index) {
                final double pding = index != albumList.length ? 15 : 0;
                return Padding(
                  padding: EdgeInsets.only(right: pding),
                  child: AlbumWidget(model: albumList[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
