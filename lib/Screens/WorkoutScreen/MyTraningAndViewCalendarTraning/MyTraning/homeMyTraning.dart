import 'package:body_strong/Screens/WorkoutScreen/Workout/home_workout.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class HomeMyTraning extends StatefulWidget {
  const HomeMyTraning({super.key});

  @override
  State<HomeMyTraning> createState() => _HomeMyTraningState();
}

class _HomeMyTraningState extends State<HomeMyTraning> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: ThemeColorAndfont().backScreen(context),
            body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Мои тренировка", style: TextStyle(
                        fontSize: 38
                    )),
                    SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Text("Записывайте данные во время тренировки", style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeWorkout()));
                          },
                        child: Text("Создать", style: TextStyle(
                            fontSize: 20
                        )
                      )
                    ),
                  ],
                )
            )
        )
    );
  }
}
