import 'dart:convert';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/homeMyTraning.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/traningList.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exercise_template extends StatefulWidget {
  Exercise_template (
      this.avatar,
      this.nameExercise,
      /*this.textExecution,
      this.textWrong,
      this.context,
      this.nav*/
  );
  String avatar;
  String nameExercise;

  @override
  State<Exercise_template> createState() => _Exercise_templateState();
}

class _Exercise_templateState extends State<Exercise_template> {
  List<Traninglist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("traningList");
    if(strList != null) {
      list = strList.map((item) => Traninglist.fromJson(json.decode(item))).toList();
    }
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
          appBar: ThemeColorAndfont().backScreen(context),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
              )
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Padding(
                padding: const EdgeInsets.only(top: 80),
                 child: SizedBox(
                    height: 250,
                    width: 250,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.avatar),
                    ),
                  ),
                  ),
                  Text(widget.nameExercise,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 38)
                  ),
                  Text("Техника выполнения", style: TextStyle(fontSize: 26)),
                  Text("Туда сюда", style: TextStyle(fontSize: 26)),
                  Text("Туда сюда", style: TextStyle(fontSize: 26)),
                  ElevatedButton(onPressed: (){
                    list.insert(0, Traninglist(
                      name: widget.nameExercise
                    ));
                    List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                    sharedPreferences.setStringList("traningList", strList);
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => HomeMyTraning()
                        )
                      );
                    },
                    child: Text("Добавить упражнение"),
                  )
                ],
              )
            ),
          )
      );
  }
}
