
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/screens/artist_screen/widgets/artist_about.dart';
import 'package:musicapp/ui/main_widgets/album_list.dart';
import 'package:musicapp/ui/main_widgets/music_list.dart';
import 'package:musicapp/ui/main_widgets/artist_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ArtistScrollScreen extends StatefulWidget {
  const ArtistScrollScreen(
      {super.key, required this.scroll, required this.model});
  final ArtistModel model;
  final ScrollController scroll;

  @override
  State<ArtistScrollScreen> createState() => _ArtistScrollScreenState();
}

class _ArtistScrollScreenState extends State<ArtistScrollScreen> {
  int index = 0;
  late PageController _controller;
  late ItemScrollController itemScrollController;

  @override
  void initState() {
    itemScrollController = ItemScrollController();
    _controller = PageController();
    super.initState();
  }

  List<String> items = [
    "songs",
    // "music",
    "Plylists",
    "singles",
    "Albums",
    "About",
    "more artists",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  double padding = index == items.length ? 0 : 10;
                  Color color = this.index == index
                      ? MyColors.myWhite
                      : MyColors.myWhite.withOpacity(.5);
                  Color textColor = this.index == index
                      ? MyColors.myOrange
                      : MyColors.myBlack;

                  return SizedBox(
                    width: 150,
                    child: Padding(
                      padding: EdgeInsets.only(right: padding),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: color),
                        onPressed: () => setState(() {
                          this.index = index;
                          _controller.jumpTo(0);
                          _controller.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }),
                        child: Text(
                          items[index],
                          textAlign: TextAlign.center,
                          style: TextStyleManger.mainTextLexend.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
        Expanded(
          child: PageView(
            controller: _controller,
            children: [
              MusicList(modelList: widget.model.songs, scroll: widget.scroll),
              // ArtistMusicList(
              //     modelList: widget.model.musics, scroll: widget.scroll),
              AlbumList(
                  modelList: widget.model.playlist, scroll: widget.scroll),
              AlbumList(modelList: widget.model.singles, scroll: widget.scroll),
              AlbumList(modelList: widget.model.albums, scroll: widget.scroll),
              ArtistAbout(
                  about: widget.model.description, controller: widget.scroll),
              ArtistList(modelList: widget.model.artist, scroll: widget.scroll)
            ],
            onPageChanged: (value) => setState(() {
              index = value;
              itemScrollController.scrollTo(
                  index: index,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubic);
            }),
          ),
        ),
      ],
    );
  }
}
