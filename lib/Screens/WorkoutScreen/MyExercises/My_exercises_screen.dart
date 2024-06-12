import 'package:body_strong/Screens/WorkoutScreen/MyExercises/%D1%81reating_an_exercise_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/home_workout.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyExercises extends StatefulWidget {
  const MyExercises({super.key});

  @override
  State<MyExercises> createState() => _MyExercisesState();
}

class _MyExercisesState extends State<MyExercises> {
  Key key = GlobalKey();
  var title = "";
  var description = "";
  var warning = "";

  @override
  void initState() {
    getSaveData();
    super.initState();
  }

  getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    title = prefs.getString("title")!;
    description = prefs.getString("description")!;
    warning = prefs.getString("warning")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.backspace), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWorkout()));
            },
          )
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: title.isNotEmpty && description.isNotEmpty && warning.isNotEmpty ? Column(
              children: [
                Text(title),
                Text(description),
                Text(warning),
                ElevatedButton(onPressed: () {
                  setState(() async {
                    const MyExercises();
                    final prefs = await SharedPreferences.getInstance();
                    prefs.remove("title");
                    prefs.remove("description");
                    prefs.remove("warning");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyExercises()));
                  });
                }, child: const Text("удалить")),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatingAnExercise()
                      )
                    );
                  },
                  child: Text("Добавить упражнение")
                )
              ]
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Ваши упражнения", style: TextStyle(
                    fontSize: 38
                )),
                const SizedBox(height: 40),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Text("Сохраняйте ваши упражнения и используйте их", style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),textAlign: TextAlign.center,),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreatingAnExercise()));
                    },
                    child: const Text("Создать", style: TextStyle(
                        fontSize: 20
                    )
                  )
                ),
              ],
            )
          )
        )
      )
    );
  }
}
