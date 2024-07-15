import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:body_strong/Screens/Setting/notifications.dart';
import 'package:flutter/material.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}
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