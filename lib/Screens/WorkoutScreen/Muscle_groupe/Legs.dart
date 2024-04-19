import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Legs extends StatelessWidget {
  const Legs({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "legs",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Legs.json"
    );
  }
}
