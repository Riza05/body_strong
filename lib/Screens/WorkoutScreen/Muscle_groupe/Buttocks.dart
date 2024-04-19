import 'package:body_strong/Screens/WorkoutScreen/exercises_template.dart';
import 'package:flutter/material.dart';

class Buttocks extends StatelessWidget {
  const Buttocks({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercises_template(
        "buttocks",
        "gif",
        "name",
        "/Exercise_template",
        context,
        "assets/Json_fiels/Exercises/Buttocks.json"
    );
  }
}