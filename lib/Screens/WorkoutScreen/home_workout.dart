import 'package:body_strong/Screens/MainScreens/HomeScreen/Main_menus_screens.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/WorkoutScreen/Measurements/homeMeasurements.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyExercises/My_exercises_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/homeMyTraning.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/tabata_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/Training_programs/traningPrograms.dart';
import 'package:body_strong/Screens/WorkoutScreen/Warm-up/warm-up_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout/home_workout.dart';
import 'package:flutter/material.dart';

class HomeWorkout extends StatelessWidget {
  const HomeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menus_screen(
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

        widget: [
          Workout(),
          MyExercises(),
          HomeMyTraning(),
          WarmUp(),
          Tabata(),
          TraningPrograms(),
          HomeMeasurements(),
        ],
      )
    );
  }
}



