import 'package:body_strong/Screens/WorkoutScreen/exercise_template.dart';
import 'package:flutter/material.dart';

class Abs extends StatelessWidget {
  const Abs({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercise_template("abs", "gif", "name");
  }
}
