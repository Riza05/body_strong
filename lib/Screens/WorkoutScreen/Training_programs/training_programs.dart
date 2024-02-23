import 'package:flutter/material.dart';

class List_training_programs extends StatelessWidget {
  const List_training_programs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg")
              )
            ),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 50,
                color: Colors.black,
              );
            }
          )
        )
      )
    );
  }
}
