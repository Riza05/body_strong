import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercise_template extends StatefulWidget {
  Exercise_template(this.muscle_group, this.gif, this.name);

  String muscle_group;
  String gif;
  String name;


  @override
  State<Exercise_template> createState() => _Exercise_templateState();
}

class _Exercise_templateState extends State<Exercise_template> {
  List _json = [];

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString("assets/Json_fiels/Abs.json");
    final data = await jsonDecode(response);
    setState(() {
      _json = data[widget.muscle_group];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              readJsonFile();
            }, child: Text("ssss")),
            _json.isNotEmpty ? Expanded(child: ListView.builder(
                itemCount: _json.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Row(
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image(image: AssetImage(_json[index][widget.gif])
                                )
                            ),
                            Text(_json[index][widget.name])
                          ]
                      )
                  );
                }
            ),
            ) : Container()
          ]
        )
      )
    );
  }
}
