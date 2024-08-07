import 'package:flutter/material.dart';
import 'package:musicapp/constans/strings.dart';

class HomeBodyAppBar extends StatelessWidget {
  const HomeBodyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello Amilly !",
            style: TextStyle(),
          ),
          CircleAvatar(
            radius: 25,
            foregroundImage: NetworkImage(homePicUrl),
          )
        ]);
  }
}
