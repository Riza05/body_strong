import 'dart:async';

import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:flutter/material.dart';

class EndWarmUpAndTabata extends StatefulWidget {
  const EndWarmUpAndTabata({super.key});

  @override
  State<EndWarmUpAndTabata> createState() => _EndWarmUpAndTabataState();
}

class _EndWarmUpAndTabataState extends State<EndWarmUpAndTabata> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Вы молодец! Продолжайте в том же духе", style: TextStyle(
              fontSize: 26
            ),
              textAlign: TextAlign.center,
            ),
            Image(image: AssetImage("assets/output-onlinegiftools.gif"),
              height: 200,
              width: 200,
            )
          ],
        ),
      )
    );
  }
}
