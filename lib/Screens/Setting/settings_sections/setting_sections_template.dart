import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingSectionTemplate extends StatefulWidget {
  SettingSectionTemplate(this.widget, this.name);
  final Widget widget;
  final String name;

  @override
  State<SettingSectionTemplate> createState() => _SettingSectionTemplateState();
}

class _SettingSectionTemplateState extends State<SettingSectionTemplate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Generate_a_image().m()),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(widget.name,
                        style:
                            TextStyle(fontSize: 38, color: Color(0xFFFAFF00))),
                  ),
                  Expanded(child: widget.widget)
                ]))));
  }
}
