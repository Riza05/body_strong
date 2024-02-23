import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/Main_menus_screens.dart';
import 'package:flutter/material.dart';

import '../Сommon_widgets_screens/Generate_a_image.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menus_screen(
        textTitle: 'BODY STRONG',
        backgroundImage: Generate_a_image().m(),
        con: context,
        navigator: "/Workout_screen"
      )
    );
  }
}


