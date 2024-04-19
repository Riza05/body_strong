import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Shoulders extends StatelessWidget {
  const Shoulders({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "shoulders",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Shoulders.json"
    );
  }
}