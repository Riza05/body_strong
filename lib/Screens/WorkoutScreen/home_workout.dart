import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/WorkoutScreen/workout_menus.dart';
import 'package:flutter/material.dart';

class HomeWorkout extends StatelessWidget {
  const HomeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Workout_menus(
        textTitle: "BODY WORKOUT",
        backgroundImage: Generate_a_image().m(),
        motivationText: Generating_a_motivational_text().m(),
        sections: const [
          "Упражнения",
          "Мои упражнения",
          "Мои тренировки",
          "Разминка",
          "Табата",
          "Программы",
          "Замеры",
        ],
      )
    );
  }
}



