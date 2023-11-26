import 'package:body_strong/Screens/MainScreens/Menu_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Main_screen extends StatelessWidget {
  final String textTitle;
  final String textMotivation;
  final String backgroundImage;

  const Main_screen({super.key,
    required this.textMotivation,
    required this.textTitle,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),fit: BoxFit.cover
            )
          ),
          child: Menu_screen(),
        )
      )
    );
  }
}

class _Btn extends StatelessWidget {
  final ImageIcon icon;
  final String navigator;

  const _Btn({super.key,
    required this.icon,
    required this.navigator
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: icon, onPressed: () {
      Navigator.pushNamed(context, navigator);
    });
  }
}
