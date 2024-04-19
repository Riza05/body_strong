import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class List_of_exercises extends StatelessWidget {
  const List_of_exercises({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: jkk()
        )
    );
  }
}

class List_exercises extends StatelessWidget {
  List_exercises({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 60),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/AeDYoPkHqrL6hO.gif"),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 80)),
                SizedBox(
                  height: 50,
                  width: 210,
                  child: ElevatedButton(onPressed: (){}, child: Text("eeee")))
              ]
            )
          );
        }
    );
  }
}

class jkk extends StatefulWidget {
  const jkk({super.key});

  @override
  State<jkk> createState() => _jkkState();
}

class _jkkState extends State<jkk> {
  List biceps = [];

  Future<void> readJsonFile() async {
    final Future<String> response = rootBundle.loadString("assets/Json_fiels/Abs.json");
    final data = await jsonDecode(response as String);

    setState(() {
      biceps = data["abs"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        biceps.isNotEmpty ? Expanded(
            child: ListView.builder(
              itemCount: biceps.length,
                itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: Text(biceps[index]["gif"], style: TextStyle(color: Colors.black),),
                    title: Text(biceps[index]["name"]),
                  ),
                );
                }
          )
        ) : Container()
      ]
    );
  }
}
