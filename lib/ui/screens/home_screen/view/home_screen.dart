import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/artist_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/recommed_list.dart';
import 'package:musicapp/ui/screens/home_screen/widgets/music_widget_list.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              if (state is HomeScreenSuccess) {
                List<MusicModel> modelList = state.musicModel;
                return Column(
                  children: [
                    const HomeBodyAppBar(),
                    const ArtistList(),
                    MusicWidgetList(ModelList: modelList),
                    const RecommedList()
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
