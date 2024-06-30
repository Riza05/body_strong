import 'dart:convert';
import 'package:body_strong/Screens/WorkoutScreen/MyExercises/%D1%81reating_an_exercise_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyExercises/exercisesList.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyExercises/pageWithSpecificExercise.dart';
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
  List<Exerciseslist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("exercisesList");
    if(strList != null) {
      list = strList.map((item) => Exerciseslist.fromJson(json.decode(item))).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
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
            child: list.isNotEmpty ?
               Column(
                 children: [
                   Expanded(
                     child: ListView.builder(
                       itemCount: list.length,
                       itemBuilder: (context, index) {
                         return Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             SizedBox(
                               height: 100,
                               width: 100,
                               child: CircleAvatar(
                                 backgroundImage: AssetImage("assets/na-avy-parni-44.jpg")
                               ),
                             ),
                             ElevatedButton(
                               onPressed: (){
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) =>
                                       PageWithSpecificExercise(
                                         list[index].title,
                                         list[index].description,
                                         list[index].warning
                                     )
                                   )
                                 );
                               },
                               child: Text(list[index].title)
                             ),
                             IconButton(
                               onPressed: (){
                                 setState(() {
                                   list.remove(list[index]);
                                   List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                                   sharedPreferences.setStringList("exercisesList", strList);
                                 });
                               },
                               icon: Icon(Icons.delete, size: 30, color: Colors.red,)
                             )
                           ],
                         );
                       }
                                 ),
                   ),
                 ],
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
              ],
            )
          )
        ),
        floatingActionButton:SizedBox(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              String refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreatingAnExercise()));
              if(refresh == "Data") {
                setState(() {
                  getData();
                });
              }
            },
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            child: Icon(Icons.add),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
      )
    );
  }
}
