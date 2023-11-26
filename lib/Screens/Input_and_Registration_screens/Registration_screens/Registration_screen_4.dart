import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_4 extends StatelessWidget {
  const Registration_screen_4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: "30%",
          percent: 0.3,
          nameScreen: "Ваша активность",
          widget: _Registration_screen_4())
    );
  }
}

class _Registration_screen_4 extends StatefulWidget {
  const _Registration_screen_4({super.key});

  @override
  State<_Registration_screen_4> createState() => _Registration_screen_4State();
}

class _Registration_screen_4State extends State<_Registration_screen_4> {
  bool isChecked = false;
  List<String> text = <String>[
    "Сидячий образ жизни",
    "Легкая активность",
    "Умеренная активность",
    "Высокая активность"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index){
          return CheckboxListTile(
            title: Text(text[index]),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            activeColor: Colors.yellow,
            controlAffinity: ListTileControlAffinity.leading,
          );
        }
    );
  }
}