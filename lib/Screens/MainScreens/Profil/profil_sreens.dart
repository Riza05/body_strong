import 'dart:io';
import 'package:body_strong/Screens/MainScreens/Profil/add_image_screen.dart';
import 'package:flutter/material.dart';

//Страница "Профиль"
class Profil extends StatefulWidget {

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  //Icons.add_box_outlined
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                )),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                leading: const Icon(Icons.add, size: 30),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddImage()));
                    },
                    child: const Icon(Icons.access_time))
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
            ),
          body: Center(
            child: Container(
                child: Column(
                    children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: CircleAvatar(
                          backgroundImage: AssetImage("assets/na-avy-parni-44.jpg")),
                    ),
                  ),
                  const Text("Риза Мисриханов", style: TextStyle(fontSize: 38)),
                  const Padding(
                    padding: EdgeInsets.only(top: 35),
                  ),
                  /*const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Icon(),
                    _Icon(),
                    _Icon(),
                    _Icon(),
                  ]
                ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: btn("Посты"),
                      ),
                    ],
                  ),
                ]
              )
            ),
        ),
      )
    );
  }
}

Widget btn(String nameBtn) {
  SizedBox a = SizedBox(
      height: 60,
      width: 210,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFAFF00)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
        onPressed: () {},
        child: Text(nameBtn,
            style: const TextStyle(
              fontSize: 26,
            )),
      ));
  return a;
}