import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Abs.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Back.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Buttocks.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Chest.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Forearms.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Legs.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Shoulders.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Triceps.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

//Лист групп мышц в разделе тренировки в зале
class HomeWorkout extends StatelessWidget {
  List name = [
    "Трицепс",
    "Грудь",
    "Спина",
    "Ноги",
    "Плечи",
    "Ягодицы",
    "Предплечья",
    "Пресс",
    "Шея"
  ];

  List widget = [
    Triceps(),
    Chest(),
    Back(),
    Legs(),
    Shoulders(),
    Buttocks(),
    Forearms(),
    Abs(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "Группы мышц",
                  style: TextStyle(
                    fontSize: 38,
                    color: Color(0xFFFAFF00)
                  )
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 5),
                    itemCount: name.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/na-avy-parni-44.jpg"),
                              )
                            ),
                            SizedBox(
                              width: 210,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => widget[index]
                                    )
                                  );
                                },
                                child: Text(
                                  name[index],
                                  style: TextStyle(
                                    fontSize: 26
                                  )
                                )
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),
                )
            ]
          ),
        )
      )
    );
  }
}
