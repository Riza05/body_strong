import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/Generate_a_image.dart';
import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/Main_menus_screens.dart';
import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/scroll_menu_items_widget.dart';
import 'package:flutter/material.dart';

class Foot_main_screen extends StatelessWidget {
  const Foot_main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menus_screen(
        textTitle: 'BODY STRONG',
        backgroundImage: Generate_a_image().m(),
        con: context,
        navigator: "/Home_screen",
      ),
    );
  }
}
