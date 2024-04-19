import 'package:flutter/material.dart';

class Tabata_exercises_template extends StatelessWidget {
  Tabata_exercises_template(
      this.gif,
      this.name
  );
  
  List gif;
  List name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            Container(
              child: Row(
                children: [
                  Image(image: AssetImage(gif[index])),
                  Text(name[index])
                ]
              )
            );
          }
        ),
      ),
    );
  }
}
