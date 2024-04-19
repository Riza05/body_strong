import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class CreatingAnExercise extends StatelessWidget {
  const CreatingAnExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Text("Загрузите фото"),
              Text("Название"),
              Text("Описание"),
              Text("Предупреждения"),
            ]
          )
        )
      )
    );
  }
}
