import 'package:body_strong/Screens/WorkoutScreen/Training_programs/trainingProcess.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class TraningPrograms extends StatelessWidget {
  List names = [
    [],
  ];

  List img = [
    [
      "assets/na-avy-parni-44.jpg",
      "assets/png-clipart-fitness-fitness.png"
    ],
    [
      "assets/pngwing.com.png",
      "assets/26956302.png"
    ],
  ];

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
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context,index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                child: SizedBox(
                  width: 300,
                  height: 340,
                  child: Card(
                    // Implement InkResponse
                    child: InkResponse(
                      highlightShape: BoxShape.rectangle,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TraningProcess(img[index])));
                      },
                      // Add image & text
                      child: Stack(
                        children: [
                          Ink.image(
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              image: const AssetImage(
                                  "assets/na-avy-parni-44.jpg")),
                          Column(
                              children: [
                                Divider(),
                                Text(names[index])
                              ],
                            ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),
                )
            );
          }
        )
      )
    );
  }
}
