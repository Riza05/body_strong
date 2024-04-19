import 'package:body_strong/Screens/WorkoutScreen/tabata_and_programs_template.dart';
import 'package:flutter/material.dart';

class Tabata extends StatelessWidget {
  const Tabata({super.key});

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
        "Рельеф",
      ]
    );
  }
}
