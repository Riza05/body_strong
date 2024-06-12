import 'dart:convert';
import 'package:body_strong/Screens/WorkoutScreen/Muscle_groupe/exercise_template.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercises_template extends StatefulWidget {
  Exercises_template(
    this.muscle_group,
    this.gif,
    this.name,
    this.nav,
    this.con,
    this.muscle,
  );

  String muscle_group;
  String gif;
  String name;
  String nav;
  BuildContext con;
  String muscle;

  @override
  State<Exercises_template> createState() => _Exercises_templateState();
}

class _Exercises_templateState extends State<Exercises_template> {
  List _json = [];

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString(widget.muscle);
    final data = await jsonDecode(response);
    setState(() {
      _json = data[widget.muscle_group];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
                )
              ),
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: ElevatedButton(onPressed: (){
                        readJsonFile();
                      }, child: Text("kkkkk")),
                    ),
                    _json.isNotEmpty ? Expanded(child: ListView.builder(
                        padding: EdgeInsets.only(top: 80),
                        itemCount: _json.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircleAvatar(backgroundImage: AssetImage(_json[index][widget.gif]))),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: SizedBox(
                                            height: 50,
                                            width: 210,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                Navigator.push(
                                                  widget.con,
                                                  MaterialPageRoute(
                                                    builder: (context) => Exercise_template(
                                                      _json[index][widget.gif],
                                                      _json[index][widget.name],
                                                    )
                                                  )
                                                );
                                              },
                                              child: Text(_json[index][widget.name],
                                                textAlign: TextAlign.center,style: const TextStyle(
                                                fontSize: 18
                                              )),
                                            ),
                                          )
                                      )
                                    ]
                                )
                            ),
                          );
                        }
                    )
                    ) : Container()
                  ]
              )
          )
      )
    );
  }
}
