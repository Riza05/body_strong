import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Registration_screen_1 extends StatelessWidget {
  final String textPrecent;
  final double percent;
  final String navigator;
  final String nameScreen;

  const Registration_screen_1({super.key,
    required this.textPrecent,
    required this.percent,
    required this.navigator,
    required this.nameScreen
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)))
          )
        )
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bigpicture_ru_adobestock_216484492 1.png"),fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: const EdgeInsets.only(top: 100), child:
                CircularPercentIndicator(
                  progressColor: Colors.yellow,
                  radius: 100.0,
                  percent: percent,
                  animation: true,
                  lineWidth: 10.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(textPrecent, style: const TextStyle(
                    fontSize: 50,
                    color: Colors.yellow)))),
              Text(nameScreen, style: const TextStyle(
                fontSize: 38,
                color: Colors.yellow
              )),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Имя")),
              Container(
                child: Column(
                  children: [
                    SizedBox(width: 210, height: 50, child:
                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, navigator);
                      }, child: const Text("Далее", style: TextStyle(
                        fontSize: 26
                      )))),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(width: 210, height: 50, child:
                      ElevatedButton(onPressed: (){
                      }, child: const Text("Назад", style: TextStyle(
                        fontSize: 26
                      ))))
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}


