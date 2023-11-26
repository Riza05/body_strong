import 'package:flutter/material.dart';

import 'Model.dart';

class Registration_screen_7 extends StatelessWidget {
  const Registration_screen_7({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: "40%",
          percent: 0.4,
          nameScreen: "Укажите ваш рост",
          widget: _Registration_screen_7()
      ),
    );
  }
}

class _Registration_screen_7 extends StatefulWidget {
  const _Registration_screen_7({super.key});

  @override
  State<_Registration_screen_7> createState() => _Registration_screen_7State(150, 150, 220);
}

class _Registration_screen_7State extends State<_Registration_screen_7> {
  _Registration_screen_7State(this.height, this.min, this.max);

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
