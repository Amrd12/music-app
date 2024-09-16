import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicapp/constans/themedata.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/ui/screens/album_screen/cubit/album_cubit.dart';
import 'package:musicapp/ui/screens/artist_screen/cubit/artist_cubit.dart';
import 'package:musicapp/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:musicapp/ui/screens/layout_screen/view/layout_screen.dart';
import 'package:musicapp/ui/screens/platlist_screen/cubit/playlist_cubit.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';
import 'package:flutter/services.dart';
import 'package:musicapp/ui/screens/search_screen/cubit/search_cubit.dart';

void main() async {
  await dotenv.load(fileName: "data.env");
  setup();
  // AudioPlayerHandler _audioHandler = locator.get<AudioPlayerHandler>();

  // _audioHandler = await AudioService.init(
  //   builder: () => AudioPlayerHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.example.musicapp.channel.audio',
  //     androidNotificationChannelName: 'Music playback',
  //   ),
  // );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.bottom],
  );

  runApp(const MainApp());
}

class MyAudioHandler {}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeScreenCubit(),
          ),
          BlocProvider(
            create: (context) => PlayerMiniCubit(),
          ),
          BlocProvider(
            create: (context) => PlaylistCubit(),
          ),
          BlocProvider(
            create: (context) => AlbumCubit(),
          ),
          BlocProvider(
            create: (context) => ArtistCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          ),
        ],
        child: MaterialApp(
          title: "music app",
          debugShowCheckedModeBanner: false,
          theme: themedata,
          home: const Scaffold(
            body: Center(
              child: LayoutScreen(),
            ),
          ),
        ));
  }
}
