import 'package:flutter/material.dart';

class Profil_screen extends StatelessWidget {
  final String textTitle;
  final String textMotivation;
  final Icon icon;
  final String backgroundImage;
  //final String navigator;

  const Profil_screen({super.key,
    required this.textMotivation,
    required this.icon,
    required this.textTitle,
    required this.backgroundImage,
    //required this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(backgroundImage), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.only(top: 80),
                  child: Text(textTitle, style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                    color: Colors.yellow
                ))),
                Text(textMotivation, style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white
                )),
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(icon: icon, onPressed: () {
                        //Navigator.pushNamed(context, navigator);
                      }),
                      IconButton(icon: icon, onPressed: () {
                        //Navigator.pushNamed(context, navigator);
                      })
                    ],
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}
