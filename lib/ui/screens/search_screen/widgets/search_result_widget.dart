import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/ui/main_widgets/album_list.dart';
import 'package:musicapp/ui/main_widgets/artist_list.dart';
import 'package:musicapp/ui/main_widgets/music_list.dart';
import 'package:musicapp/ui/main_widgets/playlist_list.dart';
import 'package:musicapp/ui/screens/search_screen/cubit/search_cubit.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget(
      {super.key, required this.model, required this.close});
  final SearchModel model;
  final ValueNotifier<bool> close;
  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  Widget screen = const Center(
    child: Text("Error no Screen"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              screen = const Center(child: CircularProgressIndicator());
            }
            if (state is MusicResult) {
              screen = MusicList(modelList: state.musicList);
            }
            if (state is PlaylistResult) {
              screen = PlaylistList(modelList: state.artistList);
            }
            if (state is AlbumResult) {
              screen = AlbumList(modelList: state.albumList);
            }
            if (state is ArtistResult) {
              screen = ArtistList(modelList: state.artistList);
            }
            if (state is SearchError) {
              screen = Center(child: Text(state.message));
            }
            return Stack(
              children: [
                screen,
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: IconButton(
                      onPressed: () => widget.close.value = true,
                      icon: const Icon(Icons.arrow_back_ios_new, size: 30)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
