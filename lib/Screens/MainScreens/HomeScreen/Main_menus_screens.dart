import 'package:body_strong/Pqw.dart';
import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/Ingredients.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:body_strong/Screens/MainScreens/Events_screen.dart';
import 'package:body_strong/Screens/Profil/profil_sreens.dart';
import 'package:body_strong/Screens/Articles/articles_template_json.dart';
import 'package:body_strong/Screens/FootScreens/foot_main_screen.dart';
import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/WorkoutScreen/Workout_screen.dart';
import 'package:flutter/material.dart';

//Обработчик меню для всех разделов
class Main_menus_screen extends StatefulWidget {
  String textTitle;
  String backgroundImage;
  String motivationText;
  List sections;

  Main_menus_screen({
    required this.textTitle,
    required this.backgroundImage,
    required this.motivationText,
    required this.sections,
  });

  @override
  State<Main_menus_screen> createState() => _Main_menus_screenState();
}

class _Main_menus_screenState extends State<Main_menus_screen> {
  List<Widget> widgets = [
    Profil(),
    Ingredients(),
    Workout_screen(),
    MyApp(),
    HomeFoot(),
    ArticlesTemplateJson(),
    Maps(),
    Home_setting(),
  ];

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
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.backgroundImage),
                  fit: BoxFit.cover)),
          child: Stack(children: <Widget>[
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(widget.textTitle,
                        style: TextStyle(fontSize: 38, color: Color(0xFFFAFF00))),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                        widget.motivationText,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        textAlign: TextAlign.center,
                    ),
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
                                    width: 300,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => widgets[index]));
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
            onPressed: () {}, icon: Icon(Icons.access_time_filled_outlined, color: Colors.white)),
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
