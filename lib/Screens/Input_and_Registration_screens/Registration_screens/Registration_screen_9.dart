import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_9 extends StatelessWidget {
  const Registration_screen_9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
          textPrecent: "100%",
          percent: 1,
          nameScreen: "Логин и пароль",
          widget: _Registration_screen_10(),
          con: context,
          nav: "/Profil_screen",
      ),
    );
  }
}

class _Registration_screen_10 extends StatefulWidget {
  const _Registration_screen_10({super.key});

  @override
  State<_Registration_screen_10> createState() => _Registration_screen_10State();
}

class _Registration_screen_10State extends State<_Registration_screen_10> {
  List<String> text = <String> [
    "Логин",
    "Пароль"
  ];

  List<Icon> icon = <Icon> [
    const Icon(Icons.login),
    const Icon(Icons.password),
  ];

  List<bool> isBool = [
    false,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              minLines: 1,
              maxLength: 14,
              obscureText: isBool[index],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: (icon[index]),
                labelText: (text[index]),
                labelStyle: const TextStyle(
                  fontSize: 26,
                  color: Colors.black
                ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.yellow,
                    width: 5.0
                )
              )
            )
          ),
        );
      }
    );
  }
}
