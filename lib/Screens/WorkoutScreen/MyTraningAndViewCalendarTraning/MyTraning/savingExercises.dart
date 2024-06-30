import 'dart:convert';

import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/homeMyTraning.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/obra.dart';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/traningList.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavingExercises extends StatefulWidget {
  SavingExercises(
    this.avatar,
    this.nameExercise,
    this.num
  );
  String avatar;
  String nameExercise;
  int num;

  @override
  State<SavingExercises> createState() => _SavingExercisesState();
}

final pov = TextEditingController();

class _SavingExercisesState extends State<SavingExercises> {
  final kg = TextEditingController();
  final pov = TextEditingController();

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

  Obra obra = Obra();

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(widget.avatar)
                                )
                              ),
                              Text(widget.nameExercise, style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              )),
                            ],
                          ),
                        ),
                      ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(list[index].kg),
                                    Text(list[index].pov
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMyTraning()));
                        },
                        child: Text("Закочнить тренировку")
                      )
                    ],
                  )
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _dialog(context);
              }
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Dialog _dialog(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Подход №1", style: TextStyle(
                fontSize: 26
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("КГ"),
                  Container(
                    width: 150,
                    child: TextFormField(
                      controller: kg,
                      decoration: InputDecoration(),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.plus_one)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ПОВ"),
                  Container(
                    width: 150,
                    child: TextFormField(
                      controller: pov,
                      decoration: InputDecoration(),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.plus_one)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        list.insert(0, Traninglist(
                            kg: kg.text,
                            pov: kg.text
                        ));
                        List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                        sharedPreferences.setStringList("traningList", strList);
                        Navigator.pop(context,"Da");
                      });
                    },
                    child: Text("Сохранить", style: TextStyle(
                      color: Colors.green,
                      fontSize: 18
                    ))
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
