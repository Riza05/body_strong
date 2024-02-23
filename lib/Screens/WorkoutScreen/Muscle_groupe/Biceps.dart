import 'package:body_strong/Screens/WorkoutScreen/exercise_template.dart';
import 'package:flutter/material.dart';

class Biceps extends StatelessWidget {
  const Biceps({super.key});

  @override
  Widget build(BuildContext context) {
    return Exercise_template("biceps", "gif", "name");
  }
}
