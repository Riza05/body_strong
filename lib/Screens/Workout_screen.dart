import 'package:body_strong/Screens/MainScreens/Main_screen.dart';
import 'package:flutter/material.dart';

class Workout_screen extends StatelessWidget {
  const Workout_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Profil_screen(
        textMotivation: "workout",
        icon: Icon(Icons.access_time_sharp),
        textTitle: "BODY WORKOUT",
        backgroundImage: "assets/bodibilder-myshtsy-sportsmen-sportzal-press 1.png",
        //navigator: "/",
      )
    );
  }
}
