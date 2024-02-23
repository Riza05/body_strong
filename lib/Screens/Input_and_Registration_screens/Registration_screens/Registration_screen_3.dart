import 'package:flutter/material.dart';
import 'Model.dart';
import 'Registration_screen_4.dart';

class Registration_screen_3 extends StatelessWidget {
  const Registration_screen_3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Model(
          textPrecent: "20%",
          percent: 0.2,
          nameScreen: "Ваш пол",
          widget: _Registration_screen_3(),
          con: context,
          nav: "/Registration_screen_4",
        )
    );
  }
}

class _Registration_screen_3 extends StatefulWidget {
  const _Registration_screen_3({super.key});

  @override
  State<_Registration_screen_3> createState() => _Registration_screen_3State();
}

class _Registration_screen_3State extends State<_Registration_screen_3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage("assets/pngwing.com.png"), height: 200, width: 200),
        Image(image: AssetImage("assets/png-clipart-fitness-fitness.png"), height: 200, width: 200),
      ]
    );
  }
}
