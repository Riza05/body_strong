import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/list_tabata_and_warm-up.dart';
import 'package:flutter/material.dart';

class Tabata_screen extends StatelessWidget {
  List tabatas = [
    "Фулбоди",
    "Пресс",
    "Верхняя часть тела",
    "Нижняя часть тела",
    "Сожги жир",
    "Рельеф",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
              )),
            child: List_tabata_and_warm(
                "assets/na-avy-parni-44.jpg",
                ["Фулбоди",
                  "Пресс",
                  "Верхняя часть тела",
                  "Нижняя часть тела",
                  "Сожги жир",
                  "Рельеф"
              ],
            6)
          ),
        )
      )
    );
  }
}