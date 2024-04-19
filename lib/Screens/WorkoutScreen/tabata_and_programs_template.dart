import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/Tabata_exercises/tabata_abs_screen.dart';
import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/Tabata_exercises/tabata_exercises_template.dart';
import 'package:flutter/material.dart';

class TabataAndProgramsTemplate extends StatefulWidget {
  String name;
  List tabatas;

  TabataAndProgramsTemplate(
    this.name,
    this.tabatas
  );

  @override
  State<TabataAndProgramsTemplate> createState() => _TabataAndProgramsTemplateState();
}

class _TabataAndProgramsTemplateState extends State<TabataAndProgramsTemplate> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0
          ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Text(widget.name, style: TextStyle(
                      fontSize: 38,
                      color: Color(0xFFFAFF00)
                    )),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 30),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/na-avy-parni-44.jpg"),
                                        fit: BoxFit.cover
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 200,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Tabata_abs()
                                            )
                                          );
                                        },
                                        child: Center(
                                          child: Text(widget.tabatas[index], style: TextStyle(
                                              fontSize: 38,
                                              color: Colors.white
                                          )),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
      )
    );
  }
}