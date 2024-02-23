import 'package:flutter/material.dart';

import 'Model.dart';

class Registration_screen_7 extends StatelessWidget {
  const Registration_screen_7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
          textPrecent: "60%",
          percent: 0.6,
          nameScreen: "Желаемый вес",
          widget: _Registration_screen_7(),
          con: context,
          nav: "/Registration_screen_8",
      ),
    );
  }
}

class _Registration_screen_7 extends StatefulWidget {
  const _Registration_screen_7({super.key});

  @override
  State<_Registration_screen_7> createState() => _Registration_screen_7State(45, 45, 130);
}

class _Registration_screen_7State extends State<_Registration_screen_7> {
  double height;
  double min;
  double max;

  _Registration_screen_7State(this.height, this.min, this.max);

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
