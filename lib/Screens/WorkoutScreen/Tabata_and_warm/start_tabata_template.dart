import 'dart:ui';

import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class StartTabata extends StatefulWidget {
  StartTabata(this.gif, this.name);
  List gif;
  List name;
  Color backgroundColor = Color(0xFFFAFF00);

  @override
  State<StartTabata> createState() => _StartTabataState();
}

class _StartTabataState extends State<StartTabata> {
  final int _startDuration = 10;
  final int _endDuration = 20;
  final CountDownController _controller = CountDownController();
  int index = 0;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  void set() {
    if (_startDuration == 0) {
      setState(){

      }
    }
  }

  String q(defaultFormatterFunction, duration) {

    if (duration.inSeconds == 0) {
      // only format for '0'
      return "Время окончено";
    } else {
      // other durations by it's default format
      return Function.apply(defaultFormatterFunction, [duration]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Center(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CircleAvatar(backgroundImage: AssetImage(widget.gif[index]))),
                      Text(widget.name[index], style: TextStyle(
                        fontSize: 26
                      )),
                      CircularCountDownTimer(
                        // Countdown duration in Seconds.
                        duration: _endDuration,

                        // Countdown initial elapsed Duration in Seconds.
                        initialDuration: 0,

                        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                        controller: _controller,

                        // Width of the Countdown Widget.
                        width: 150,

                        // Height of the Countdown Widget.
                        height: 150,

                        // Ring Color for Countdown Widget.
                        ringColor: Colors.white,

                        // Ring Gradient for Countdown Widget.
                        ringGradient: null,

                        // Filling Color for Countdown Widget.
                        fillColor: const Color(0xFFFAFF00),

                        // Filling Gradient for Countdown Widget.
                        fillGradient: null,

                        // Background Color for Countdown Widget.
                        backgroundColor: Colors.black45.withOpacity(0.2),

                        // Background Gradient for Countdown Widget.
                        backgroundGradient: null,

                        // Border Thickness of the Countdown Ring.
                        strokeWidth: 10.0,

                        // Begin and end contours with a flat edge and no extension.
                        strokeCap: StrokeCap.round,

                        // Text Style for Countdown Text.
                        textStyle: const TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                        // Format for the Countdown Text.
                        textFormat: CountdownTextFormat.S,

                        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                        isReverse: true,

                        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                        isReverseAnimation: true,

                        // Handles visibility of the Countdown Text.
                        isTimerTextShown: true,

                        // Handles the timer start.
                        autoStart: false,

                        // This Callback will execute when the Countdown Starts.
                        onStart: () {
                          // Here, do whatever you want
                          debugPrint('Countdown Started');
                        },

                        // This Callback will execute when the Countdown Ends.
                        onComplete: () {
                          // Here, do whatever you want
                          debugPrint('Countdown Ended');
                        },

                        // This Callback will execute when the Countdown Changes.
                        onChange: (String timeStamp) {
                          // Here, do whatever you want
                          debugPrint('Countdown Changed $timeStamp');
                        },

                        /*
                          * Function to format the text.
                          * Allows you to format the current duration to any String.
                          * It also provides the default function in case you want to format specific moments
                            as in reverse when reaching '0' show 'GO', and for the rest of the instances follow
                            the default behavior.
                        */
                        //timeFormatterFunction: () {}
                      ),
                    ],
                  ),
              ),
            ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            _button(
              title: "Старт",
              onPressed: () => _controller.start(),
            ),
            const SizedBox(
              width: 10,
            ),
            _button(
              title: "Стоп",
              onPressed: () => _controller.pause(),
            ),
            const SizedBox(
              width: 10,
            ),
            _button(
              title: "Рестарт",
              onPressed: () => _controller.resume(),
            ),
            const SizedBox(
              width: 10,
            ),
            _button(
              title: "Рестарт",
              onPressed: () => _controller.restart(duration: _endDuration),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFFAFF00)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}