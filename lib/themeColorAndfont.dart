import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Шрифт,цвет для theme
class ThemeColorAndfont {
  ThemeData themeColorAndfont(BuildContext context) => ThemeData(
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: Color(0xFFFAFF00),
      fontFamily: GoogleFonts.kronaOne().fontFamily
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFAFF00)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
        )
      )
    )
  );

  AppBar backScreen(BuildContext context) => AppBar(
  leading: BackButton(
  onPressed: (){
  Navigator.pop(context);
  },
  color: const Color(0xFFFAFF00)
  ),
      backgroundColor: Colors.transparent,
      elevation: 0
  );
}
