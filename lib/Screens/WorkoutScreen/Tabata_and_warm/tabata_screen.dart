import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/abs.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/burnFat.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/fullbody.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/lowerBody.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/relief.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_pages/upperBody.dart';
import 'package:body_strong/Screens/WorkoutScreen/tabata_and_programs_template.dart';
import 'package:flutter/material.dart';

class Tabata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabataAndProgramsTemplate(
      "Табата",
      const [
        "Фулбоди",
        "Пресс",
        "Верхняя часть тела",
        "Нижняя часть тела",
        "Сожги жир",
        "Рельеф"
      ],
      const [
        "assets/image/Tabata/12408d103615133.5f50d1babfbbd.jpg",
        "assets/image/Tabata/imgpreview.jpeg",
        "assets/image/Tabata/shutterstock_535512460.jpg",
        "assets/image/Tabata/poza-figura-muscle-myshtsy-muscles-press-atlet-bodybuildi-10.jpg",
        "assets/na-avy-parni-44.jpg",
        "assets/na-avy-parni-44.jpg",
      ],

      [
        Fullbody().img,
        BurnFat().img,
        Relief().img
      ],

      [
        Fullbody().name,
        Abs().name,
        UpperBody().name,
        LowerBody().name,
        BurnFat().name,
        Relief().name
      ],

      [
        Fullbody(),
        Abs(),
        UpperBody(),
        LowerBody(),
        BurnFat(),
        Relief()
      ]
    );
  }
}
