import 'dart:convert';
import 'package:body_strong/Screens/WorkoutScreen/MyTraningAndViewCalendarTraning/MyTraning/traningList.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout/home_workout.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeMyTraning extends StatefulWidget {
  String? a;
  String? b;
  HomeMyTraning({this.a, this.b});

  @override
  State<HomeMyTraning> createState() => _HomeMyTraningState();
}

class _HomeMyTraningState extends State<HomeMyTraning> {
  DateTime dateTime = DateTime.now();
  DateTime? _time;
  Map<DateTime, List<Traninglist>> events = {};

  final kg = TextEditingController();
  final pov = TextEditingController();

  String? d;
  String? e;

  List<Traninglist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("traningList");
    if (strList != null) {
      list = strList.map((item) => Traninglist.fromJson(json.decode(item))).toList();
      setState(() {});
    }
  }

  List<Traninglist> _get(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void initState() {
    _get(dateTime);
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
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  child: TableCalendar(
                    selectedDayPredicate: (day) => isSameDay(day, dateTime),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    firstDay: DateTime.utc(2023, 1, 1),
                    lastDay: DateTime.utc(2050, 3, 14),
                    focusedDay: dateTime,
                    eventLoader: _get,
                    onDaySelected: _onDaySelected,
                  )
                ),
              ),
                list.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  card(list[index].name),
                                  IconButton(
                                      onPressed: (){
                                        setState(() {
                                          list.remove(list[index]);
                                          List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                                          sharedPreferences.setStringList("traningList", strList);
                                        });
                                      },
                                      icon: Icon(Icons.delete, size: 30, color: Colors.red,)
                                  )
                                ],
                              ),
                             ],
                          ),
                        );
                      }
                  ),
                ) : Text("У вас пока нету тренировок")
            ],
          )
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Workout()));
            },
        ),
      )
    );
  }

  Widget card(String name) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name),
            IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context) {
                  return _dialog(context);
                  }
                );
              },
              icon: const Icon(Icons.add)
            )
          ],
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
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.plus_one)),
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
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.plus_one)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          d = kg.text;
                          e = pov.text;
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
