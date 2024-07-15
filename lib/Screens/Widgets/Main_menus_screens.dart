import 'package:body_strong/Pqw.dart';
import 'package:body_strong/Screens/MainScreens/Events_screen.dart';
import 'package:body_strong/Screens/MainScreens/Profil/profil_sreens.dart';
import 'package:body_strong/Screens/Articles/articles_template_json.dart';
import 'package:body_strong/Screens/FootScreens/foot_main_screen.dart';
import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Main_menus_screen extends StatefulWidget {
  final String textTitle;
  final String backgroundImage;
  final String motivationText;
  final List sections;

  const Main_menus_screen(
      {super.key,
      required this.textTitle,
      required this.backgroundImage,
      required this.motivationText,
      required this.sections});

  @override
  State<Main_menus_screen> createState() => _Main_menus_screenState();
}

class _Main_menus_screenState extends State<Main_menus_screen> {
  List<Widget> a = [
    Profil(),
    Workout_screen(),
    MyApp(),
    Foot_main_screen(),
    ArticlesTemplateJson(),
    Evenets_screen(),
    Home_setting()
  ];

  ArticlesTemplateJson articlesTemplateJson = new ArticlesTemplateJson();

  final ScrollController _controller = ScrollController();
  bool scroll_visibility = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels > 0)
        scroll_visibility = false;
      else
        scroll_visibility = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {});
    return MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.kronaOne().fontFamily,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFAFF00)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
          ),
        ),
        home: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.backgroundImage),
                  fit: BoxFit.cover)),
          child: Stack(children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(widget.textTitle,
                      style: TextStyle(fontSize: 38, color: Color(0xFFFAFF00))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Text(
                    widget.motivationText,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 1,
                builder: (context, controller) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: ListView.builder(
                          controller: controller,
                          itemCount: widget.sections.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                height: 50,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => a[index]));
                                    },
                                    child: Text(widget.sections[index],
                                        style: TextStyle(fontSize: 26))),
                              ),
                            );
                          }));
                })
          ]),
        )));
  }

  Widget q() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined)),
      ],
    );
  }
}
