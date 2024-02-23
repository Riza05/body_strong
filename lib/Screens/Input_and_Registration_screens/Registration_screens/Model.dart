import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Model extends StatelessWidget {
  const Model({
    super.key,
    //required this.nav,
    required this.textPrecent,
    required this.percent,
    required this.nameScreen,
    //required this.isInput,
    required this.widget,
    required this.con,
    required this.nav
  });

  final String textPrecent;
  final double percent;
  final String nameScreen;
  //final String isInput;
  final Widget widget;
  final BuildContext con;
  final String nav;

  @override
  Widget build(BuildContext context) {
    /*Widget addedWidget;
    if (isInput == "textField") {
      //addedWidget = const TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Имя"));
    //} else if (isInput == "slider"){
      //addedWidget = Text('Теперь тут текст');
    }*/

    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bigpicture_ru_adobestock_216484492 1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircularPercentIndicator(
                  progressColor: Color(0xFFFAFF00),
                  radius: 100.0,
                  percent: percent,
                  animation: true,
                  lineWidth: 10.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(textPrecent, style: const TextStyle(fontSize: 50, color: Colors.yellow)),
                ),
              ),
              Text(nameScreen, style: const TextStyle(fontSize: 38, color: Colors.yellow)),
              widget,
              Column(
                children: [
                  SizedBox(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(con, nav);
                      },
                      child: const Text("Далее", style: TextStyle(fontSize: 26)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(con);
                      },
                      child: const Text("Назад", style: TextStyle(fontSize: 26)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
