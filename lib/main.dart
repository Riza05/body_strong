import 'package:body_strong/Screens/Input_and_Registration_screens/input_screen.dart';
import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:body_strong/Screens/Setting/notifications.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Notifications.init();
  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
    },
    initialRoute: "/",
  ));
}