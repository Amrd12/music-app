import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicapp/constans/themedata.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:musicapp/ui/screens/layout_screen.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

void main() async {
  await dotenv.load(fileName: "data.env");
  setup();
  AudioPlayerHandler _audioHandler = locator.get<AudioPlayerHandler>();

  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.musicapp.channel.audio',
      androidNotificationChannelName: 'Music playback',
    ),
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
        ],
        child: MaterialApp(
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
