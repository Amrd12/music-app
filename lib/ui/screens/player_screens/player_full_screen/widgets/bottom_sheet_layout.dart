import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/screens/player_screens/lyric_screen/view/lyric_screen.dart';
import 'package:musicapp/ui/screens/player_screens/current_playlist_screen/view/current_playlist_screen.dart';

class BottomSheetLayout extends StatefulWidget {
  const BottomSheetLayout({super.key, required this.scrollcontroller});
  final ScrollController scrollcontroller;

  @override
  State<BottomSheetLayout> createState() => _BottomSheetLayoutState();
}

class _BottomSheetLayoutState extends State<BottomSheetLayout> {
  int index = 0;
  List<Widget> screen = [const LyricScreen(), const CurrentPlaylistScreen()];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollcontroller,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 35, // Increased height for better visibility
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.transparent),
                  onPressed: () => setState(() => index = 0),
                  child: Text(
                    "Lyrics",
                    style: TextStyleManger.secTextLexendWhite.copyWith(
                        fontSize: 20,
                        color: (index == 0) ? MyColors.myOrange : null),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.transparent),
                  onPressed: () => setState(() => index = 1),
                  child: Text(
                    "Playlist",
                    style: TextStyleManger.secTextLexendWhite.copyWith(
                        fontSize: 20,
                        color: (index == 1) ? MyColors.myOrange : null),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  padding: const EdgeInsets.all(0),
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: IndexedStack(
            index: index,
            children: screen,
          ),
        ),
      ],
    );
  }
}
