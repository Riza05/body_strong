import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/start_tabata_template.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tabata_exercises_template extends StatefulWidget {
  Tabata_exercises_template(
      this.gif,
      this.name
  );

  List<String> gif;
  List<String> name;

  @override
  State<Tabata_exercises_template> createState() => _Tabata_exercises_templateState();
}

class _Tabata_exercises_templateState extends State<Tabata_exercises_template> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: CircleAvatar(child: Image(image: AssetImage(widget.gif[index])))),
                          Text(widget.name[index])
                        ],
                      ),
                    );
                  }
              ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartTabata(name: widget.name, gif: widget.gif)),
                    );
                  },
                  child: Text("Начать"))
              ]
            ),
          ),
        ),
      )
    );
  }
}
