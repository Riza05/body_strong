import 'package:body_strong/DB/DatabaseHelper.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/input_screen.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

import '../../../Modul/note.dart';

/*class Registration_screen_9 extends StatelessWidget {
  const Registration_screen_9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
          textPrecent: "100%",
          percent: 1,
          nameScreen: "Логин и пароль",
          widget: _Registration_screen_10(),
          con: context,
          nav: "/Profil_screen",
      ),
    );
  }
}*/

class Registration_screen_10 extends StatefulWidget {
  const Registration_screen_10({super.key});

  @override
  State<Registration_screen_10> createState() => Registration_screen_10State();
}

class Registration_screen_10State extends State<Registration_screen_10> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final String textTry = "Поле не должно быть пустым";

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        //SingleChildScrollView to have an scrol in the screen
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Generate_a_image().m()),
              fit: BoxFit.cover
            )
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("BODY STRONG",
                    style: TextStyle(
                      fontSize: 38,
                    )
                  ),
                  const ListTile(
                    title: Text(
                      "Станьте частью нашей команды",
                      style:
                      TextStyle(
                        fontSize: 26,
                        color: Color(0xFFFAFF00)
                      ),
                        textAlign: TextAlign.center
                    ),
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //We will copy the previous t
                            // extfield we designed to avoid time consuming



                            //As we assigned our controller to the textformfields

                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: username,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return textTry;
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Color(0xFFFAFF00),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Имя",
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                            //Password field
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return textTry;
                                  }
                                  return null;
                                },
                                obscureText: !isVisible,
                                decoration: InputDecoration(
                                    icon: const Icon(
                                      Icons.lock,
                                      color: Color(0xFFFAFF00)
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Пароль",
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          //In here we will create a click to show and hide the password a toggle button
                                          setState(() {
                                            //toggle button
                                            isVisible = !isVisible;
                                          });
                                        },
                                        icon: Icon(isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color(0xFFFAFF00)))),
                              ),
                            ),

                            //Confirm Password field
                            // Now we check whether password matches or not
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: confirmPassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return textTry;
                                  } else if (password.text != confirmPassword.text) {
                                    return "Не верный пароль";
                                  }
                                  return null;
                                },
                                obscureText: !isVisible,
                                decoration: InputDecoration(
                                    icon: const Icon(
                                      Icons.lock,
                                      color: Color(0xFFFAFF00)
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Повторите пароль",
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          //In here we will create a click to show and hide the password a toggle button
                                          setState(() {
                                            //toggle button
                                            isVisible = !isVisible;
                                          });
                                        },
                                        icon: Icon(isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                          color: Color(0xFFFAFF00)))),
                              ),
                            ),

                            const SizedBox(height: 10),
                            //Login button
                            Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width * .9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      //Login method will be here

                                      final db = DatabaseHelper();
                                      db.signup(Users(name: username.text, password: password.text)).whenComplete(() {
                                        //After success user creation go to login screen
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Input_screen()));
                                      });
                                    }
                                  },
                                  child: const Text(
                                    "Зарегистрировать",
                                    style: TextStyle(
                                      fontSize: 20
                                    ),
                                  )),
                            ),

                            //Sign up button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Уже есть аккаунт?"),
                                TextButton(
                                    onPressed: () {
                                      //Navigate to sign up
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Input_screen()));
                                    },
                                    child: const Text("Войти", style: TextStyle(
                                      fontSize: 20
                                    )))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
        ),
    );
  }
}
