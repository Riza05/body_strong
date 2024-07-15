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

  void _onDaySelected(DateTime day, DateTime focuseDay) {
    setState(() {
      dateTime = day;
    });
  }

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
                    onDaySelected: _onDaySelected,
                  )
                ),
              ),
                list.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return card(
                          list[index].name,
                          index
                        );
                      }
                  ),
                ) : const Text("У вас пока нету тренировок")
            ],
          )
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Workout()));
            },
            child: const Icon(Icons.add),
        ),
      )
    );
  }

  Widget card(String name, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: 150,
        width: 300,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 150
                    ),
                    child: Text(name)
                  ),
                  IconButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context) {
                        return _dialog(context);
                        }
                      );
                    },
                    icon: const Icon(Icons.add)
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      list.remove(list[index]);
                      List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                      sharedPreferences.setStringList("traningList", strList);
                    });
                  },
                  icon: const Icon(Icons.delete, size: 30, color: Colors.red,)
                ),
              )
            ],
          ),
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
