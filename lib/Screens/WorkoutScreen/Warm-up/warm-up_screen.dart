import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/start_tabata_template.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class WarmUp extends StatefulWidget {
  const WarmUp({super.key});

  @override
  State<WarmUp> createState() => _WarmUpState();
}

class _WarmUpState extends State<WarmUp> {
  List imgExercises = [
    "assets/image/Tabata/tabataExercises/1p5aXvvyvJ90l0.gif",
    "assets/image/Tabata/tabataExercises/4pXtT8i8j4-gva.gif",
    "assets/image/Tabata/tabataExercises/HbJj57Sb5FJED8.gif",
    "assets/image/Tabata/tabataExercises/iZVQoMoQ0BXwWp.gif",
    "assets/image/Tabata/tabataExercises/mJaZiOOtqZX6iq.gif",
    "assets/image/Tabata/tabataExercises/mpQ8qDxTA3dDuP.gif",
    "assets/image/Tabata/tabataExercises/XW0Wp336nWlYsx.gif",
    "assets/image/Tabata/tabataExercises/Yy0mtBv098gzPQ.gif",
  ];

  List nameExercises = [
    "Прыжки с разведением рук и ног в стороны",
    "Ходьба на месте",
    "Выпады",
    "Прыжки на месте с перпендикулярной постановкой ног",
    "Прыжки на месте с перпендикулярной постановкой ног",
    "Прыжки на месте с перпендикулярной постановкой ног",
    "Прыжки на месте с перпендикулярной постановкой ног",
    "Прыжки на месте с перпендикулярной постановкой ног",
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: imgExercises.length,
                  itemBuilder: (contxet, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(imgExercises[index])
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 200
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(nameExercises[index]))
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartTabata(imgExercises, nameExercises)));
                },
                child: Text("Начать")
              )
            ],
          ),
        )
      )
    );
  }
}
