import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Triceps extends StatelessWidget {
  const Triceps({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "triceps",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Triceps.json"
    );
  }
}