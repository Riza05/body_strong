import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_4 extends StatelessWidget {
  const Registration_screen_4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
          textPrecent: "30%",
          percent: 0.3,
          nameScreen: "Ваша активность",
          widget: _Registration_screen_4(),
          con: context,
          nav: "/Registration_screen_5",
      )
    );
  }
}

class _Registration_screen_4 extends StatefulWidget {
  const _Registration_screen_4({super.key});

  @override
  State<_Registration_screen_4> createState() => _Registration_screen_4State();
}

class _Registration_screen_4State extends State<_Registration_screen_4> {
  int _selectedValue = 0;
  List<String> text = <String>[
    "Сидячий образ жизни",
    "Легкая активность",
    "Умеренная активность",
    "Высокая активность"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[0], style: const TextStyle(
              fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 1,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 1;
              }
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[1], style: const TextStyle(
              fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 2,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 2;
              }
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[2], style: const TextStyle(
              fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 3,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 3;
              }
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[3], style: const TextStyle(
              fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 4,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 4;
              }
            });
          },
        ),
      ],
    );
  }
}