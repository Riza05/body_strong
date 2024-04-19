import 'package:body_strong/Screens/MainScreens/home_screen.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/WorkoutScreen/workout_menus.dart';
import 'package:flutter/material.dart';

class Workout_screen extends StatelessWidget {
  const Workout_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Workout_menus(
        textTitle: "BODY WORKOUT",
        backgroundImage: Generate_a_image().m(),
        motivationText: Generating_a_motivational_text().m(),
        sections: const [
          "Тренировки в зале",
          "Тренировки дома/улице",
          "Мои упражнения",
          "Разминка",
          "Табата",
          "Замеры",
          "Программы",
          "Мои тренировки",
        ],
      )
    );
  }
}



