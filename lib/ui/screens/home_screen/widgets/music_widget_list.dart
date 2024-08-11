import 'package:flutter/material.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/music_widget.dart';

import '../../../../constans/strings.dart';
import '../../../../constans/text_style_manager.dart';

class MusicWidgetList extends StatelessWidget {
  MusicWidgetList({super.key, required this.ModelList});
  List<MusicModel> ModelList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("New Releases", style: TextStyleManger.mainTextLexend),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: ModelList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final double pding = index != ModelList.length ? 10 : 0;
              MusicModel item = ModelList[index];
              return Padding(
                padding: EdgeInsets.only(right: pding),
                child: MusicWidget(model: item),
              );
            },
          ),
        )
      ],
    );
  }
}
