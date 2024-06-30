import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/Setting/settings_sections/Lis.dart';
import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => UserAccountState();
}

class UserAccountState extends State<UserAccount> {
  List names = [
    "Имя",
    "Возраст",
    "Рост",
    "Вес",
    "Желаемый вес",
    "Пол",
    "Активность",
    "Цель",
    "Логин",
    "Пароль",
  ];

  List num = [
    0,1,2,3,4,5,6,7
  ];

  var name = "";
  var age = "";
  var height = "";
  var width = "";
  var desiredWeight = "";
  var gender = "";
  var activity = "";
  var purpose = "";
  var login = "";
  var password = "";

  @override
  void initState() {
    getSaveData();
    super.initState();
  }

  getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    age = prefs.getString("age")!;
    height = prefs.getString("height")!;
    width = prefs.getString("width")!;
    desiredWeight = prefs.getString("desiredWeight")!;
    gender = prefs.getString("gender")!;
    activity = prefs.getString("activity")!;
    purpose = prefs.getString("purpose")!;
    login = prefs.getString("login")!;
    password = prefs.getString("password")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSetting()));
          },
          icon: Icon(Icons.add),
        )),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TextFontPage(names, num[index])));
                        },
                        child: Text(names[index], style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )
                      )
                    ), name.isNotEmpty ?
                    Text(name, style: TextStyle(color: Colors.black)) : Text("ksksks")
                  ],
                ),
                Divider()
              ],
            );
          }
        ),
      ),
    );
  }
}

