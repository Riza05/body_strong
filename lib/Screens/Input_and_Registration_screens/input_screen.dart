import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input_screen extends StatelessWidget {
  const Input_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFAFF00)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
          ),
        )
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Generate_a_image().m()),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text("BODY STRONG", style: TextStyle(
                    fontSize: 38,
                    fontFamily: GoogleFonts.kronaOne().fontFamily,
                    color: const Color(0xFFFAFF00)
                  ))
                ),

                Text(Generating_a_motivational_text().m(), style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),textAlign: TextAlign.center),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _Form()
                  )
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 210 ,
                          child: ElevatedButton(onPressed: () {
                            Navigator.pushNamed(context, "/Home_screen");
                          },
                              child: const Text("Войти", style: TextStyle(
                                fontSize: 26
                            ))
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 50,
                            width: 210,
                            child: ElevatedButton(onPressed: () {
                              Navigator.pushNamed(context, "/Registration_screen_1");
                            }, child: const Text("Регистрация", style: TextStyle(
                              fontSize: 26
                            )))
                          ),
                        )
                      ]
                    ),
                  )
                )
              ]
            ),
          )
        )
      )
    );
  }
}

class _Form extends StatelessWidget {
  final _GlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: Form(
          key: _GlobalKey,
          child: Column(
              children: [
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isNotEmpty) {
                        return null;
                      }
                      return "euiieie";
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      //prefixIcon: Icon(Icons.add),
                      labelText: "Имя",
                      labelStyle: const TextStyle(
                          fontSize: 26,
                          color: Colors.black
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                ),
              ]
          ),
        )
    );
  }
}

