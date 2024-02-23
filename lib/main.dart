import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/tabata_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_1.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_8.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_9.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_6.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_7.dart';
import 'package:body_strong/Screens/MainScreens/home_screen.dart';
import 'Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_2.dart';
import 'Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_3.dart';
import 'Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_4.dart';
import 'Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_5.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Tabata_screen(),
      "/Home_screen": (context) => Home_screen(),
      "/Registration_screen_1": (context) => Registration_screen_1(),
      "/Registration_screen_2": (context) => Registration_screen_2(),
      "/Registration_screen_3": (context) => Registration_screen_3(),
      "/Registration_screen_4": (context) => Registration_screen_4(),
      "/Registration_screen_5": (context) => Registration_screen_5(),
      "/Registration_screen_6": (context) => Registration_screen_6(),
      "/Registration_screen_7": (context) => Registration_screen_7(),
      "/Registration_screen_8": (context) => Registration_screen_8(),
      "/Registration_screen_9": (context) => Registration_screen_9(),
      "/Workout_screen": (contex) => Workout_screen()
    },
    initialRoute: "/",
  ));
}


