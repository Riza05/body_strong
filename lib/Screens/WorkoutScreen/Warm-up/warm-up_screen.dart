import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/list_tabata_and_warm-up.dart';
import 'package:flutter/material.dart';

class WarmUp extends StatelessWidget {
  const WarmUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: List_tabata_and_warm("assets/na-avy-parni-44.jpg",
            [
              "skssk",
              "ppdkd"
            ],
          8,
          [
          "/Tabata_fulbadi_training",
          "/Tabata_press_training",
          "/Tabata_upper_part_training",
          "/Tabata_lower_part_training",
          "/Tabata_burn_the_fat_training",
          "/Tabata_relief_press_training",
          ],
          context
        )
      )
    );
  }
}
