import 'package:flutter/material.dart';
import 'MainScreens/Main_screen.dart';

class Foot_screen extends StatelessWidget {
  const Foot_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Profil_screen(
          textMotivation: "foot",
          icon: Icon(Icons.ac_unit_outlined),
          textTitle: "BODY FOOT",
          //navigator: "/",
          backgroundImage: "assets/bigpicture_ru_adobestock_216484492 1.png",
        )
    );
  }
}
