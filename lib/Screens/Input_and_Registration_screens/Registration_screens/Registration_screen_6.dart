import 'package:flutter/material.dart';

import 'Model.dart';

class Registration_screen_6 extends StatelessWidget {
  const Registration_screen_6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
          textPrecent: "50%",
          percent: 0.5,
          nameScreen: "Укажите ваш вес",
          widget: _Registration_screen_6(),
          con: context,
          nav: "/Registration_screen_7",
      ),
    );
  }
}

class _Registration_screen_6 extends StatefulWidget {
  const _Registration_screen_6({super.key});

  @override
  State<_Registration_screen_6> createState() => _Registration_screen_6State(45, 45, 180);
}

class _Registration_screen_6State extends State<_Registration_screen_6> {
  double height;
  double min;
  double max;

  _Registration_screen_6State(
      this.height,
      this.min,
      this.max
      );

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
