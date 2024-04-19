import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Chest extends StatelessWidget {
  const Chest({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "chest",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Chest.json"
    );
  }
}
