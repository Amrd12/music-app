import 'package:flutter/material.dart';
import 'package:musicapp/constans/strings.dart';

class HomeBodyAppBar extends StatelessWidget {
  const HomeBodyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Hello Amilly !",
        style: Theme.of(context).primaryTextTheme.bodyLarge,
      ),
      const CircleAvatar(
        radius: 25,
        foregroundImage: NetworkImage(homePicUrl),
      )
    ]);
  }
}
