import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exercise_template extends StatefulWidget {
  Exercise_template (
      this.avatar,
      this.nameExercise,
      /*this.textExecution,
      this.textWrong,
      this.context,
      this.nav*/
  );
  String avatar;
  String nameExercise;

  @override
  State<Exercise_template> createState() => _Exercise_templateState();
}

class _Exercise_templateState extends State<Exercise_template> {
  /*String textExecution;
  String textWrong;
  BuildContext context;
  String nav;*/
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
              padding: const EdgeInsets.only(top: 80),
               child: SizedBox(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.avatar),
                  ),
                ),
                ),
                Text(widget.nameExercise,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 38)
                ),
                Text("Техника выполнения", style: TextStyle(fontSize: 26)),
                Text("Туда сюда", style: TextStyle(fontSize: 26)),
                Text("Туда сюда", style: TextStyle(fontSize: 26)),
              ],
            )
          ),
        )
    );
  }
}
