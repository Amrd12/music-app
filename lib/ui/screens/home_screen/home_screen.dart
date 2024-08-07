import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/constans/strings.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_widget.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/release_widget.dart';

import 'widgets/home_body_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          HomeBodyAppBar(),
          ArtistList(),
          Text("New Releases",
              style: Theme.of(context).primaryTextTheme.bodyMedium),
          ReleaseWidget(
              songName: "In The Moring", author: "Riell", picLink: homePicUrl),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
