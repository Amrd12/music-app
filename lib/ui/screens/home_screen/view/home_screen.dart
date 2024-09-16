import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/album_list_widget.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/music_widget_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/playlist_list_widget.dart';

import '../widgets/home_body_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenCubit>(context).getPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenSuccess) {
          List<MusicModel>? modelList = state.quickPicks;
          List<PlaylistModel>? boostyourMood = state.boostYourMood;
          List<PlaylistModel>? summer = state.summer_2024;
          List<PlaylistModel>? afterWorkFeeling = state.afterWorkFeeling;
          List<ArtistModel>? artistList = state.topArtist;
          List<AlbumModel>? newReleaseAlbums = state.newReleaseAlbums;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBodyAppBar(),
                  if (artistList != null) ArtistList(artstisList: artistList),
                  if (modelList != null) MusicWidgetList(modelList: modelList),
                  if (boostyourMood != null)
                    PlaylistListWidget(
                        title: "Boost Your Mind", playlist: boostyourMood),
                  if (summer != null)
                    PlaylistListWidget(
                        title: "summer_2024_☀️🌴🍉", playlist: summer),
                  if (afterWorkFeeling != null)
                    PlaylistListWidget(
                        title: "After Work Feeling",
                        playlist: afterWorkFeeling),
                  if (newReleaseAlbums != null)
                    AlbumListWidget(
                      title: "New Realse Album",
                      albumList: newReleaseAlbums,
                    ),
                ],
              ),
            ),
          );
        } else {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
