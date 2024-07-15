import 'dart:async';
import 'package:body_strong/Screens/endWarmUpAndTabata.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class StartTabata extends StatefulWidget {
  StartTabata(this.gif, this.name);
  final List gif;
  final List name;
  final Color backgroundColor = Color(0xFFFAFF00);

  @override
  State<StartTabata> createState() => _StartTabataState();
}

class _StartTabataState extends State<StartTabata> {
  //final int _endDuration = 20;
  int num = 0;
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  Duration w = Duration(seconds: 3);

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      if(seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        num++;
        stop(reset: false);
      }
    });
  }

  void resetTimer() => setState(() => seconds = maxSeconds);

  void stop({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() => timer?.cancel());
  }

  @override
  void initState() {
    setState(() {
      btnTime();
    });
    super.initState();
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
                        child: CircleAvatar(backgroundImage: AssetImage(widget.gif[num]))),
                      Text(widget.name[num], style: const TextStyle(
                        fontSize: 26
                        ),
                        textAlign: TextAlign.center,
                      ),
                      btnTimer(),
                      btn(),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EndWarmUpAndTabata()));
                        },
                        child: Text("Закончить")
                      )
                    ],
                  ),
              ),
            ),
        ),
      ),
    );
  }

  Widget btnTimer() => SizedBox(
    height: 200,
    width: 200,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: seconds / maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 10,
          backgroundColor: Color(0xFFFAFF00),
        ),
        Center(child: btnTime())
      ],
    ),
  );

  Widget btnTime() {
    if (seconds == 0) {
      return const Icon(Icons.check, color: Color(0xFFFAFF00), size: 80);
    } else {
      return Text("$seconds",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 80
        )
      );
    }
  }

    Widget btn() {
      final isRunning = timer == null ? false : timer!.isActive;
      final isCompleted = seconds == maxSeconds || seconds == 0;

      return isRunning || !isCompleted ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWidget(
              onClicked: (){
                if (isRunning) {
                  stop(reset: false);
                } else {
                  startTimer(reset: false);
                }
              },
              text: isRunning ? "Пауза" : "ооыоы"
          ),
          ButtonWidget(
              onClicked: stop,
              text: "Рестарт"
          ),
        ],
      ) : ButtonWidget(
          text: "Начать",
          onClicked: (){
            startTimer();
          }
      );
    }
  }


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({super.key, required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onClicked,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20
      ),
    )
  );
}