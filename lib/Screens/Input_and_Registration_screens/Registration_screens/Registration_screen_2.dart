import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_2 extends StatelessWidget {
  const Registration_screen_2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Model(
          textPrecent: "10%",
          percent: 0.1,
          nameScreen: "Укажите ваш возраст",
          widget: _Registration_screen_2(height: 15, min: 15, max: 90)
      )
    );
  }
}

class _Registration_screen_2 extends StatefulWidget {
  final double height;
  final double min;
  final double max;

  const _Registration_screen_2({
    super.key,
    required this.height,
    required this.min,
    required this.max
  });

  @override
  State<_Registration_screen_2> createState() => _Registration_screen_2State();
}

class _Registration_screen_2State extends State<_Registration_screen_2> {

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData(
            trackHeight: 16,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18)
        ),
        child: Slider(
            value: widget.height,
            min: widget.min,
            max: widget.max,
            //divisions: 220,
            activeColor: Colors.yellow,
            label: widget.height.round().toString(),
            onChanged: (height) => setState(() {
              //this.widget.height = widget.height;
            })
        )
    );
  }
}