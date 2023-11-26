import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Registration_screen_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: '0%',
          percent: 0.0,
          nameScreen: 'Как вас зовут?',
          widget: _TextField()
      )
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
          style: const TextStyle(
            fontSize: 26
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            //prefixIcon: Icon(Icons.add),
            labelText: "Имя",
            labelStyle: const TextStyle(
              fontSize: 26,
              color: Colors.black
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
          )
      ),
    );
  }
}



