import 'package:body_strong/Screens/WorkoutScreen/beginning_tabata_and_warm.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class TabataAndProgramsTemplate extends StatefulWidget {
  String name;
  List tabatas;
  List img;
  List qqq;
  List o;
  List widget;

  TabataAndProgramsTemplate(
    this.name,
    this.tabatas,
    this.img,
    this.qqq,
    this.o,
    this.widget,
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
                Text(widget.name),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.widget.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BeginningTabataAndWarm(widget.widget,widget.qqq[index],widget.o[index])));
                          },
                          child: Image(image: AssetImage(widget.img[index])),
                        )
                      );
                    }
                  ),
                ),
              ],
            ),
        )
      )
    );
  }
}