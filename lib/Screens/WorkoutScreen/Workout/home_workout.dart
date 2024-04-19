import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Abs.dart';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/Back.dart';
import 'package:flutter/material.dart';

class HomeWorkout extends StatelessWidget {
  List name = [
    "Бицепс",
    "Трицепс",
    "Плечи",
    "Грудь",
    "Спина",
    "Ноги",
    "Ягодицы",
  ];

  List widget = [
    Abs(),
    Biceps()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFAFF00)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        ),
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
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
                    itemCount: 7,
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
