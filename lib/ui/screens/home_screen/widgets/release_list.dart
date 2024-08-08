import 'package:flutter/material.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/release_widget.dart';

import '../../../../constans/strings.dart';
import '../../../../constans/text_style_manager.dart';

class ReleaseList extends StatelessWidget {
  const ReleaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("New Releases", style: TextStyleManger.mainTextLexend),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final double pding = index != 5 ? 10 : 0;
              return Padding(
                padding: EdgeInsets.only(right: pding),
                child: const ReleaseWidget(
                    songName: "In The Moring",
                    author: "Riell",
                    picLink: homePicUrl),
                    
              );
            },
          ),
        )
      ],
    );
  }
}
