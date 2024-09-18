import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/main_widgets/album_list.dart';
import 'package:musicapp/ui/main_widgets/artist_list.dart';
import 'package:musicapp/ui/main_widgets/music_list.dart';
import 'package:musicapp/ui/main_widgets/playlist_list.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({
    super.key,
    required this.scroll,
  });
  final ScrollController scroll;
  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  int index = 0;
  late PageController _controller;
  late ItemScrollController itemScrollController;

  GetUserData? data;
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getdata();
    itemScrollController = ItemScrollController();
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> items = [
    "songs",
    "Plylists",
    "Albums",
    "more artists",
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserData) {
          data = state;
        }
        return data == null
            ? const SizedBox.shrink()
            : Column(
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
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: color),
                                  onPressed: () => setState(() {
                                    this.index = index;
                                    _controller.jumpTo(0);
                                    _controller.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }),
                                  child: Text(
                                    items[index],
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyleManger.mainTextLexend.copyWith(
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
                        MusicList(
                            modelList: data!.musicList, scroll: widget.scroll),
                        AlbumList(
                            modelList: data!.albumList, scroll: widget.scroll),
                        PlaylistList(
                          modelList: data!.playlistList,
                          scroll: widget.scroll,
                        ),
                        ArtistList(
                            modelList: data!.artistList, scroll: widget.scroll)
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
      },
    );
  }
}
