import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  final String counterKey = "counter";
  final textqqq = TextEditingController();
  String a = "";
  String b = "";
  final List<String> musculGroups = [
    "Вес",
    "Шея",
    "Плечи",
    "Грудь",
    "Бицепс",
    "Предплечья",
    "Спина",
    "Талия",
    "Ягодицы",
    "Бедра",
    "Голень",
  ];

  @override
  void initState() {
    _initCounter();
    super.initState();
  }

  Future _initCounter() async {
    a = await _getCounter();
  }

  void _incrementCounter() async {
    setState(() {
      a;
    });

    await _setCounter();
  }

  Future _setCounter() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(counterKey,textqqq.text);
  }

  Future _getCounter() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(counterKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
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
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(a, style: TextStyle(
                        fontSize: 38
                      )),
                    ),
                    Expanded(
                        child: ListView.builder(
                    padding: EdgeInsets.only(top: 50),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return TextField(
                  controller: textqqq,
                  minLines: 1,
                  maxLength: 3,
                  decoration: InputDecoration(
                      labelText: musculGroups[index],
                      suffixIcon: Icon(Icons.add),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      labelStyle: const TextStyle(fontSize: 18, color: Colors.black38),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.yellow, width: 2.0)
                      )
                  )
              );
            }
        ),
                      ),
                    ElevatedButton(onPressed: () {
                      _incrementCounter();
                    }, child: Text("LLL")
                    ),
            ],
          )
        )
      )
    );
  }
}

Widget text(TextEditingController textEditingController) {
  final List<String> musculGroups = [
    "Вес",
    "Шея",
    "Плечи",
    "Грудь",
    "Бицепс",
    "Предплечья",
    "Спина",
    "Талия",
    "Ягодицы",
    "Бедра",
    "Голень",
  ];
  return ListView.builder(
    padding: EdgeInsets.only(top: 50),
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return TextField(
        controller: textEditingController,
          minLines: 1,
          maxLength: 3,
          decoration: InputDecoration(
            labelText: musculGroups[index],
              suffixIcon: Icon(Icons.add),
              filled: true,
              fillColor: Colors.grey.shade200,
              labelStyle: const TextStyle(fontSize: 18, color: Colors.black38),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow, width: 2.0)
              )
          )
      );
    }
  );
}
