import 'package:body_strong/Screens/Foot_screen.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_1.dart';
import 'package:body_strong/Screens/MainScreens/Profil_sreens.dart';
import 'package:body_strong/Screens/MainScreens/Main_screen.dart';
import 'package:body_strong/Screens/Workout_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_2.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => const Registration_screen_1(
          textPrecent: "0%",
          percent: 0.0,
          navigator: "/Registration_screen_2",
          nameScreen: "Как вас зовут?"),
      "/Registration_screen_2": (context) => const Registration_screen_2()
      /*"/": (context) => const Profil_screen(
        textMotivation: "foirofork",
        icon: Icon(Icons.accessibility),
        textTitle: "BODY STRONG",
        backgroundImage: "assets/f155a944721ac5b8f6fede66bb972f0e 1.png",
        //navigator: "/",
      ),
      "/Workout_screen": (context) => const Workout_screen(),
      "/Foot_screen": (context) => const Foot_screen(),*/
    },
    initialRoute: "/",
  ));
}

