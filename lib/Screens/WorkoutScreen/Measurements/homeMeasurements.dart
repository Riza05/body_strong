import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/WorkoutScreen/Measurements/measurements_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/home_workout.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMeasurements extends StatefulWidget {
  const HomeMeasurements({super.key});

  @override
  State<HomeMeasurements> createState() => _HomeMeasurementsState();
}

class _HomeMeasurementsState extends State<HomeMeasurements> {
  List names = [
    "Вес",
    "Шея",
    "Грудь",
    "Бицепс",
    "Предплечье",
    "Талия",
    "Бедра",
    "Голень",
  ];

  List num = [
    0,1,2,3,4,5,6,7
  ];

  var weight = "";
  var neck = "";
  var chest = "";
  var biceps = "";
  var forearms = "";
  var waist = "";
  var hips = "";
  var shin = "";

  @override
  void initState() {
    getSaveData();
    super.initState();
    setState(() {});
  }

  getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    weight = prefs.getString("Вес")!;
    neck = prefs.getString("Шея")!;
    chest = prefs.getString("Грудь")!;
    biceps = prefs.getString("Бицепс")!;
    forearms = prefs.getString("Предплечье")!;
    waist = prefs.getString("Талия")!;
    hips = prefs.getString("Бедра")!;
    shin = prefs.getString("Голень")!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWorkout()));
          },
          icon: const Icon(Icons.backspace),
        ),
          title: Text("Замеры"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: ListView(
            children: [
              textList(0, weight),
              textList(1, neck),
              textList(2, chest),
              textList(3, biceps),
              textList(4, forearms),
              textList(5, waist),
              textList(6, hips),
              textList(7, shin),
              Text(weight)
            ],
          ),
        ),
      ),
    );
  }

  Column textList(int index, String str) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Measurements(names[index])));
              },
              child: Text(names[index], style: TextStyle(
                fontSize: 18,
                  color: Colors.white,
                )
              )
            ), Text(str, style: TextStyle(color: Colors.black))
          ],
        ),
        Divider()
      ],
    );
  }
}
