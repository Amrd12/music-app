import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/screens/player_screens/lyric_screen/view/lyric_screen.dart';
import 'package:musicapp/ui/screens/player_screens/playlist_screen/view/playlist_screen.dart';

class BottomSheetLayout extends StatefulWidget {
  const BottomSheetLayout({super.key, required this.scrollcontroller});
  final ScrollController scrollcontroller;
  @override
  State<BottomSheetLayout> createState() => _BottomSheetLayoutState();
}

class _BottomSheetLayoutState extends State<BottomSheetLayout> {
  int index = 0;
  List<Widget> screen = [const LyricScreen(), PlaylistScreen()];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.0, backgroundColor: Colors.transparent),
              onPressed: () => setState(() => index = 0),
              child: const Text(
                "Lyrics",
                style: TextStyleManger.secTextLexendWhite,
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.0, backgroundColor: Colors.transparent),
              onPressed: () => setState(() => index = 1),
              child: const Text(
                "Playlist",
                style: TextStyleManger.secTextLexendWhite,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add))
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
              controller: widget.scrollcontroller,
              child: IndexedStack(index: index, children: screen)),
        )
      ],
    );
  }
}
