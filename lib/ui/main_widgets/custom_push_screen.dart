import 'package:flutter/material.dart';
import 'package:musicapp/ui/screens/player_screens/player_mini_screen/view/player_mini_screen.dart';

class CustomPushScreen extends StatelessWidget {
  const CustomPushScreen({super.key, required this.screen});
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              screen,
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 40)),
            ],
          ),
        ),
        PlayerMiniScreen(),
      ]),
    );
  }
}
