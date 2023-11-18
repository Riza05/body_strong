import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Registration_screen_1.dart';
import 'package:flutter/material.dart';

class Registration_screen_2 extends StatelessWidget {
  const Registration_screen_2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

    );
  }
}


class _Home extends StatefulWidget {
  const _Home({super.key});

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  int age = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            IconButton(onPressed: (){
              setState(() {
                age--;
              });
            }, icon: const Icon(Icons.minimize)),
            IconButton(onPressed: (){
              setState(() {
                age++;
              });
            }, icon: const Icon(Icons.add))
          ]
        )
      )
    );
  }
}
