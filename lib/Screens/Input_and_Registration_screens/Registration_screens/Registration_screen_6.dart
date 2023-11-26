import 'package:flutter/material.dart';

import 'Model.dart';

class Registration_screen_6 extends StatelessWidget {
  const Registration_screen_6({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: "40%",
          percent: 0.4,
          nameScreen: "Укажите ваш рост",
          widget: _Registration_screen_6()
      ),
    );
  }
}

class _Registration_screen_6 extends StatefulWidget {
  const _Registration_screen_6({super.key});

  @override
  State<_Registration_screen_6> createState() => _Registration_screen_6State(150, 150, 220);
}

class _Registration_screen_6State extends State<_Registration_screen_6> {
  _Registration_screen_6State(this.height, this.min, this.max);

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
