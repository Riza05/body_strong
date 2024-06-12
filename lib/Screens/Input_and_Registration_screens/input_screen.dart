import 'package:body_strong/DB/DatabaseHelper.dart';
import 'package:body_strong/Modul/note.dart';
import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/Screens/Widgets/Generating_a_motivational_text.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

import 'Registration_screens/Registration_screen_9.dart';

//Страница с логином и паролем
class Input_screen extends StatefulWidget {
  @override
  State<Input_screen> createState() => _Input_screenState();
}

class _Input_screenState extends State<Input_screen> {
  final username = TextEditingController();
  final password = TextEditingController();

  //A bool variable for show and hide password
  bool isVisible = false;

  //Here is our bool variable
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  //Now we should call this function in login button
  login() async {
    var response = await db
        .login(Users(name: username.text, password: password.text));
    if (response == true) {
      //If login is correct, then goto notes
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      //If not, true the bool value to show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  //We have to create global key for our form
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text("BODY STRONG", style: TextStyle(
                fontSize: 36)),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
                child: Text(Generating_a_motivational_text().m(), style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ), textAlign: TextAlign.center),
              ),
              SingleChildScrollView(
                   child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      //We put all our textfield to a form to be controlled and not allow as empty
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            //Username field
                            //Before we show the image, after we copied the image we need to define the location in pubspec.yaml
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: username,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Неверное имя";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Color(0xFFFAFF00)
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Имя",
                                  hintStyle: TextStyle(color: Colors.white)
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
                                    return "Пароль не верный";
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
                                            : Icons.visibility_off
                                      ),
                                      color: Color(0xFFFAFF00),
                                    ),
                                ),
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
                                      login();

                                      //Now we have a response from our sqlite method
                                      //We are going to create a user
                                    }
                                  },
                                  child: const Text("Войти", style: TextStyle(
                                    fontSize: 20
                                  )))),
                                TextButton(
                                    onPressed: () {
                                      //Navigate to sign up
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Registration_screen_10()));
                                    },
                                    child: const Text("Регистрация",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ))),


                            // We will disable this message in default, when user and pass is incorrect we will trigger this message to user
                            isLoginTrue
                                ? const Text(
                              "Неверный логин или пароль",
                              style: TextStyle(color: Colors.red),
                            )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ),
        ),
    );
  }
}

