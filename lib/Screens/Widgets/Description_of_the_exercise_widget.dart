import 'package:flutter/material.dart';

class Description_of_exercise_widget extends StatelessWidget {
  String img;
  String titleText;
  String descriptionText;

  Description_of_exercise_widget(
      this.img,
      this.titleText,
      this.descriptionText
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(img),
            ),
            Text(titleText),
            Text(descriptionText)
          ],
        )
      )
    );
  }
}
