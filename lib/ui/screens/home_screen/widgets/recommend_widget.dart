import 'package:flutter/material.dart';

import '../../../../constans/strings.dart';
import '../../../../constans/text_style_manager.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 25, right: 25),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            // color: MyColors.myOrange,
            image: const DecorationImage(image: NetworkImage(recPicUrl)),
            borderRadius: BorderRadius.circular(35)),
        child: const Text(
          "Daily Mix",
          style: TextStyleManger.secTextLexend,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: CircleAvatar(
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(.7),
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            child: const Icon(Icons.play_arrow, size: 30)),
      ),
    ]);
  }
}
