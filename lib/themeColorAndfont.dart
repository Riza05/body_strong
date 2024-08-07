import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Шрифт,цвет для theme
class ThemeColorAndfont {
  var col = Color(0xFFFAFF00);

  ThemeData themeColorAndfont(BuildContext context) => ThemeData(
    /*textTheme: Theme.of(context).textTheme.apply(
      bodyColor: Color(0xFFFAFF00),
      fontFamily: GoogleFonts.kronaOne().fontFamily,
    ),*/
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 36,
        color: const Color(0xFFFAFF00),
        fontFamily: GoogleFonts.kronaOne().fontFamily
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFAFF00)),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 24,
          )
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
