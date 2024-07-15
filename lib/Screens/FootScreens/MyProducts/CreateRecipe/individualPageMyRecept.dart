import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IndividualPagemyRecept extends StatefulWidget {
  IndividualPagemyRecept({required this.a, required this.data});
  String a;
  List data;

  @override
  State<IndividualPagemyRecept> createState() => _IndividualPagemyReceptState();
}

class _IndividualPagemyReceptState extends State<IndividualPagemyRecept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ThemeColorAndfont().backScreen(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                    backgroundColor: Colors.red
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 40
                  ),
                  child: Text(widget.data[0],
                    style: TextStyle(
                      fontSize: 36
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _indicator(Colors.red, "Белки", widget.data[1]),
                    _indicator(Colors.indigo, "Жиры", widget.data[2]),
                    _indicator(Colors.white, "Углеводы", widget.data[3]),
                  ],
                ),
                _container("Ингредиенты: ${widget.data[4]}"),
                _container("Способ приготовления: ${widget.data[5]}"),
                _container("Способ приготовления: ${widget.data[6]}"),
                _container("Способ приготовления: ${widget.data[7]}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _indicator(Color color, String str, String text) {
    return Column(
      children: [
        CircularPercentIndicator(
          progressColor: color,
          radius: 50,
          percent: 0.3,
          animation: true,
          lineWidth: 7.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(text),
        ),
        Text(str, style: const TextStyle(
          fontSize: 16,
          color: Colors.white
        ))
      ],
    );
  }
  
  Container _container(String str) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      color: Colors.black.withOpacity(0.2),
      child: Text(str, style: const TextStyle(
        color: Colors.white,
        fontSize: 16
      )),
    );
  }
}
