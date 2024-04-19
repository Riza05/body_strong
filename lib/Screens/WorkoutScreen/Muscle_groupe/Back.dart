import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Biceps extends StatelessWidget {
  const Biceps({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
      "back",
      "gif",
      "name",
      "/Exercise_template",
      context,
      "assets/Json_fiels/Exercises/Back.json"
    );
  }
}
