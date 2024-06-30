import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class PageWithSpecificExercise extends StatelessWidget {
  PageWithSpecificExercise(this.t, this.r, this.u);
  String t;
  String r;
  String u;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    backgroundImage: AssetImage("assets/na-avy-parni-44.jpg"),
                  ),
                ),
              ),
              Text(t,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 38)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Text("Техника выполнения",style: TextStyle(fontSize: 26)),
                    SizedBox(height: 15),
                    Text(r, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Text("Опасность",style: TextStyle(fontSize: 26)),
                    SizedBox(height: 15),
                    Text(u, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){},
                child: Text("Добавить упражнение"),
              )
            ],
          )
      ),
    );
  }
}
