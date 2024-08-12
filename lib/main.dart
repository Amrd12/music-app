import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:musicapp/constans/api_constants.dart';
import 'package:musicapp/constans/themedata.dart';
import 'package:musicapp/data/api/api_service.dart';
import 'package:musicapp/data/api/music_api_service.dart';
import 'package:musicapp/data/repo/music_repo.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/ui/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:musicapp/ui/screens/layout_screen.dart';
import 'package:musicapp/ui/screens/player_mini/cubit/player_mini_cubit.dart';

void main() async {
  await dotenv.load(fileName: "data.env");
  setup();
//   final c = await ApiService().apiHomePage();
//   // print(c);

// // Assuming c["results"][ApiConstantsResponse.quickhomeVidoes] is a List
//   List<Map<String, dynamic>> x = List<Map<String, dynamic>>.from(
//       c["results"][ApiConstantsResponse.quickhomeVidoes]);

//   // print(x.runtimeType);

//   final m = MusicRepo().parseMusicModel(x);
//   // print(m);
//   final v = await MusicRepo().getMusicData(m[3]);
//   final ll = await MusicApiService().getMusicMapLyrics("Tk7WFyHUr1E");
//   print(ll);
  runApp(const MainApp());
}

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
