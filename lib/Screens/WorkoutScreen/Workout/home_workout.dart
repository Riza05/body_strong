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
class Workout extends StatelessWidget {
  Workout({super.key});

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
    const Triceps(),
    const Chest(),
    const Back(),
    const Legs(),
    const Shoulders(),
    const Buttocks(),
    const Forearms(),
    const Abs(),
  ];

  List img = [
    "assets/image/Exercises/musclegroups/muscles.png",
    "assets/image/Exercises/musclegroups/gym.png",
    "assets/image/Exercises/musclegroups/back.png",
    "assets/image/Exercises/musclegroups/muscles (1).png",
    "assets/image/Exercises/musclegroups/back (1).png",
    "assets/image/Exercises/musclegroups/muscles (1).png",
    "assets/image/Exercises/musclegroups/human.png",
    "assets/image/Exercises/musclegroups/exercise.png",
    "assets/image/Exercises/musclegroups/biceps.png",
    "assets/image/Exercises/musclegroups/back (2).png",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
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
                    padding: const EdgeInsets.only(bottom: 5),
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
                                backgroundImage: AssetImage(img[index]),
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
                                  style: const TextStyle(
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
