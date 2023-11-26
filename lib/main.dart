import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_1.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_2.dart';
import 'package:body_strong/Screens/MainScreens/Chat_screen/Chat_main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (BuildContext context) => const Chat_main_screen(),
    },
    initialRoute: "/",
  ));
}


