import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Forearms extends StatelessWidget {
  const Forearms({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "forearms",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Forearms.json"
    );
  }
}