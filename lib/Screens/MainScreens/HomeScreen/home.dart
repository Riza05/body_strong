import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/MainScreens/HomeScreen/Main_menus_screens.dart';
import 'package:flutter/material.dart';

//Раздел главного меню
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menus_screen(
        textTitle: "BODY STRONG",
        backgroundImage: Generate_a_image().m(),
        motivationText: Generating_a_motivational_text().m(),
        sections: const [
          "Профиль",
          "Тренировка",
          "Бег и ходьба",
          "Питание",
          "Статьи",
          "Чат",
          "Лента",
          "Настройки",
          "Магазины и спортзалы",
          "Личный кабинет",
        ],
      )
    );
  }
}


