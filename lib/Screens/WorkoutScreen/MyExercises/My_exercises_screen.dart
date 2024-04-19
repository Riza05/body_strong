import 'package:body_strong/Screens/WorkoutScreen/MyExercises/%D1%81reating_an_exercise_screen.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class MyExercises extends StatelessWidget {
  const MyExercises({super.key});

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
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ваши упражнения", style: TextStyle(
                  fontSize: 38
                )),
                SizedBox(height: 40),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text("Сохраняйте ваши упражнения и используйте их", style: TextStyle(
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
                          builder: (context) => CreatingAnExercise()));
                  },
                  child: Text("Создать", style: TextStyle(
                    fontSize: 20
                  ))
                )
              ],
            ),
          ),
        )
      )
    );
  }
}
