import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/strings.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/recommed_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/release_list.dart';

import 'widgets/home_body_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          SingleChildScrollView(
            child: Column(
              children: [
                HomeBodyAppBar(),
                ArtistList(),
                ReleaseList(),
                RecommedList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
