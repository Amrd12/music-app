import 'package:flutter/material.dart';
import 'package:musicapp/constans/themedata.dart';
import 'package:musicapp/ui/screens/layout_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata,
      home: const Scaffold(
        body: Center(
          child: LayoutScreen(),
        ),
      ),
    );
  }
}
