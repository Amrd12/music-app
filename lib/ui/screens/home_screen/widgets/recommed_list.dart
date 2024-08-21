import 'package:flutter/material.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/recommend_widget.dart';

import '../../../../constans/text_style_manager.dart';

class RecommedList extends StatelessWidget {
  const RecommedList({super.key, required this.title, required this.playlist});
  final List<PlaylistModel> playlist;
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
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                return RecommendWidget(model: playlist[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
