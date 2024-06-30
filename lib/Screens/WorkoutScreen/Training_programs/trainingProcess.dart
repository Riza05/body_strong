import 'package:flutter/material.dart';

class TraningProcess extends StatefulWidget {
  TraningProcess(this.w, {super.key});
  List w;

  @override
  State<TraningProcess> createState() => _TraningProcessState();
}

class _TraningProcessState extends State<TraningProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg")
          )
        ),
      ),
    );
  }
}
