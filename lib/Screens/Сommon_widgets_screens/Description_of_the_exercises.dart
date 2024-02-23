import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/List_tabata_and_warm_training.dart';
import 'package:flutter/material.dart';

class Description_of_the_exercises extends StatelessWidget {
  Description_of_the_exercises({
    super.key,
    required this.count,
    required this.image,
  });
  final int count;
  final String image;
  List_tabata_and_warm_training l = List_tabata_and_warm_training();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                            child: Image(image: AssetImage(image)
                            )
                        ),
                        Text(l.list[index], style: const TextStyle(fontSize: 26))
                      ]
                    )
                  );
              }
        )
      )
    );
  }
}
