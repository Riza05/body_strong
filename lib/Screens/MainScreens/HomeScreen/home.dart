import 'package:body_strong/Screens/Articles/articles_template_json.dart';
import 'package:body_strong/Screens/Chat/Homescreen.dart';
import 'package:body_strong/Screens/FootScreens/homeFood.dart';
import 'package:body_strong/Screens/Map/mapScreen.dart';
import 'package:body_strong/Screens/Pedometer/home_pedometer.dart';
import 'package:body_strong/Screens/Profil/profil_sreens.dart';
import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/Screens/MainScreens/HomeScreen/Main_menus_screens.dart';
import 'package:body_strong/Screens/WorkoutScreen/home_workout.dart';
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
          "Питание",
          "Бег и ходьба",
          "Статьи",
          "Чат",
          "Настройки",
          "Магазины и спортзалы",
        ],

        widget: [
          Profil(),
          HomeWorkout(),
          HomeFoot(),
          HomePedometer(),
          ArticlesTemplateJson(),
          Homescreen(),
          HomeSetting(),
          MapScreen()
        ]
      )
    );
  }
}


