import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_2.dart';
import 'package:flutter/material.dart';

class Registration_screen_5 extends StatelessWidget {
  const Registration_screen_5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: "40%", 
          percent: 0.4, 
          nameScreen: "Укажите ваш рост",
          widget: _Registration_screen_5()
      ),
    );
  }
}

class _Registration_screen_5 extends StatefulWidget {
  const _Registration_screen_5({super.key});

  @override
  State<_Registration_screen_5> createState() => _Registration_screen_5State();
}

class _Registration_screen_5State extends State<_Registration_screen_5> {
  late double height;
  late double min;
  late double max;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData(
          trackHeight: 16,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18)
        ),
        child: Slider(
        value: height,
        min: min,
        max: max,
        divisions: 220,
        activeColor: Colors.yellow,
        label: height.round().toString(),
        onChanged: (height) => setState(() {
          this.height = height;
        })
      )
    );
  }
}
