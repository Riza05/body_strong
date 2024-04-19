import 'package:flutter/material.dart';

class Exercise_template extends StatelessWidget {
  Exercise_template (
      this.avatar,
      /*this.nameExercise,
      this.textExecution,
      this.textWrong,
      this.context,
      this.nav*/
  );
  String avatar;
  /*String nameExercise;
  String textExecution;
  String textWrong;
  BuildContext context;
  String nav;*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
              onPressed: (){
                Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0
          ),
        body: Container(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
              Text("Пресс"),
              Container(
                child: Column(
                  children: [
                    Text("Техника выполнения"),
                    Text("туда сюда делай хорошо будет")
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Важно!"),
                    Text("Не убейся")
                  ],
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}
