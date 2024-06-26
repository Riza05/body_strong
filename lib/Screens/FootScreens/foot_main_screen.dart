import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/Widgets/Main_menus_screens.dart';
import 'package:flutter/material.dart';

class Foot_main_screen extends StatelessWidget {
  const Foot_main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menus_screen(
        textTitle: 'BODY STRONG',
        backgroundImage: Generate_a_image().m(),
        motivationText: Generating_a_motivational_text().m(),
        sections: const [
          "Мои продукты",
          "Мои рецепты",
          "Рецепты",
          "Программа питания",
        ],
      ),
    );
  }
}
