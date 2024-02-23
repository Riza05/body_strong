import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';


class Registration_screen_2 extends StatelessWidget {
  const Registration_screen_2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
        textPrecent: "10%",
        percent: 0.1,
        nameScreen: "Укажите ваш возраст",
        widget: _Registration_screen_2(),
        con: context,
        nav: "/Registration_screen_3",
      )
    );
  }
}

class _Registration_screen_2 extends StatefulWidget {
  _Registration_screen_2({super.key});

  @override
  State<_Registration_screen_2> createState() => _Registration_screen_2State(15, 15, 65);
}

class _Registration_screen_2State extends State<_Registration_screen_2> {
  double height;
  double min;
  double max;

  _Registration_screen_2State(this.height, this.min, this.max);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData(
            trackHeight: 10,
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
            }
          )
        )
    );
  }
}