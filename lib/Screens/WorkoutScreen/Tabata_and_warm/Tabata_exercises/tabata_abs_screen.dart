import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/Tabata_exercises/tabata_exercises_template.dart';
import 'package:flutter/material.dart';

class Tabata_abs extends StatelessWidget {
  const Tabata_abs({super.key});

  @override
  Widget build(BuildContext context) {
    return Tabata_exercises_template(
      [
        "assets/image/Exercises/abs/0ySzRi0HYVHUfU.gif",
        "assets/image/Exercises/abs/1K1d3tyB4CYmN3.gif",
        "assets/image/Exercises/abs/1N7VvvXAiMpVwJ.gif",
        "assets/image/Exercises/abs/1yqvk4LQPvwybt.gif",
        "assets/image/Exercises/abs/FdwFEQmRVEXnJK.gif",
        "assets/image/Exercises/abs/RZMcbhAcwWoB4b.gif",
        "assets/image/Exercises/abs/ZHjbCHkmPqXmAL.gif",
      ]
       ,
      [
        "Скручивание",
        "Флаг дракона",
        "Боковые скручивания на скамье 45 градусов",
        "Скручивания с согнутыми ногами",
        "Скручивания на перекладине",
        "Скруч",
        "Боковые скручивания",
      ]
    );
  }
}
