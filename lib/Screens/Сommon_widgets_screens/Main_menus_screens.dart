import 'package:flutter/material.dart';

class Main_menus_screen extends StatefulWidget {
  final String textTitle;
  final String backgroundImage;
  final BuildContext con;
  final String navigator;


  const  Main_menus_screen({super.key,
    required this.textTitle,
    required this.backgroundImage,
    required this.con,
    required this.navigator
  });

  @override
  State<Main_menus_screen> createState() => _Main_menus_screenState();
}

class _Main_menus_screenState extends State<Main_menus_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(widget.textTitle, style: TextStyle(
                      fontSize: 38,
                      color: Color(0xFFFAFF00)
                    )),
                  ),
                  Text("oeeked", style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFFFAFF00)
                    )
                  ),
                ],
              ),
          DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
          builder: (context, controller) {
          return Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)
          )
        ),
          child: ListView.builder(
    controller: controller,
    itemCount: 15,
    itemBuilder: (BuildContext context, int index) {
                            return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(widget.con, widget.navigator);
                            },
                            child: Text("djdjdjd"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(40, 20)
                          ),
                        ),
                      );
                    }
                  )
                );
              }
            )
          ]
        )
      )
    );
  }
}
