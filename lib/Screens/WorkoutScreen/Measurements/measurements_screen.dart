import 'package:body_strong/Screens/WorkoutScreen/Measurements/homeMeasurements.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Measurements extends StatefulWidget {
  Measurements(this.text);
  String text;

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  final name = TextEditingController();
  List names = [
    "name",
    "age",
    "height",
    "width",
    "desiredWeight",
    "gender",
    "activity",
    "purpose",
    "login",
    "password",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.2)
                    ),
                    child: TextFormField(
                      controller: name,
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Неверное имя";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                              Icons.person,
                              color: Color(0xFFFAFF00)
                          ),
                          border: InputBorder.none,
                          hintText: widget.text,
                          hintStyle: const TextStyle(color: Colors.black, fontSize: 18)
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        print("${widget.text}");
                        await prefs.setString("${widget.text}", name.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeMeasurements()));
                      },
                      child: const Text("Сохранить")
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}