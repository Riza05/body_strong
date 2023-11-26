import 'package:flutter/material.dart';
import 'MainScreens/Main_screen.dart';

class Foot_screen extends StatelessWidget {
  const Foot_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Main_screen(
          textMotivation: "foot",
          textTitle: "BODY FOOT",
          backgroundImage: "assets/bigpicture_ru_adobestock_216484492 1.png",
        )
    );
  }
}
