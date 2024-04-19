import 'package:body_strong/Screens/Profil/add_image_screen.dart';
import 'package:body_strong/themeColorAndfont.dart';
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
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Color(0xFFFAFF00),
                  )
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddImage()));
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Color(0xFFFAFF00),
                    )
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
            ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
              )
            ),
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