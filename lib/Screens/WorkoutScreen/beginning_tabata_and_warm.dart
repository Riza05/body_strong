import 'package:body_strong/Screens/WorkoutScreen/Tabata_and_warm/start_tabata_template.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class BeginningTabataAndWarm extends StatefulWidget {
  BeginningTabataAndWarm(this.i, this.a, this.c);
  List i;
  List a;
  List c;

  @override
  State<BeginningTabataAndWarm> createState() => _BeginningTabataAndWarmState();
}

class _BeginningTabataAndWarmState extends State<BeginningTabataAndWarm> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
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
                        itemCount: widget.a.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: CircleAvatar(backgroundImage: AssetImage(widget.a[index]))),
                                Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
                                Text(widget.c[index], style: TextStyle(
                                  fontSize: 18
                                ))
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StartTabata(widget.a, widget.c)));
                      },
                      child: Text("Начать")
                    )
                  ],
                ),

        ),
      ),
    );
  }
}
