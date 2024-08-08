import 'package:flutter/material.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/recommend_widget.dart';

import '../../../../constans/text_style_manager.dart';

class RecommedList extends StatelessWidget {
  const RecommedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recommended\nFor You Today",
              style: TextStyleManger.mainTextLexend),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return RecommendWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
