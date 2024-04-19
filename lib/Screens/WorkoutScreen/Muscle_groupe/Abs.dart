import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Abs extends StatelessWidget {
  const Abs({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
      "abs",
      "gif",
      "name",
      "/Exercise_template",
      context,
      "assets/Json_fiels/Exercises/Abs.json"
    );
  }
}
