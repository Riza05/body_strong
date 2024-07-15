import 'package:body_strong/Screens/Setting/home_setting.dart';
import 'package:body_strong/Screens/Setting/settings_sections/Lis.dart';
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
    name = prefs.getString("Имя")!;
    age = prefs.getString("Возраст")!;
    height = prefs.getString("Рост")!;
    width = prefs.getString("Вес")!;
    desiredWeight = prefs.getString("Желаемый вес")!;
    gender = prefs.getString("Пол")!;
    activity = prefs.getString("Активность")!;
    purpose = prefs.getString("Цель")!;
    login = prefs.getString("Логин")!;
    password = prefs.getString("Пароль")!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSetting()));
          },
          icon: Icon(Icons.add),
          ),
            backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: ListView(
              children: [
                textList(0, name),
                textList(1, age),
                textList(2, height),
                textList(3, width),
                textList(4, desiredWeight),
                textList(5, gender),
                textList(6, activity),
                textList(7, purpose),
                textList(8, login),
                textList(9, password),
            ],
          ),
        ),
      ),
    );
  }

  Row textList(int index, String str) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TextFontPage(names[index])));
            },
            child: Text(names[index], style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            )
            )
        ), str.isEmpty ?
        Text("") : Text(str, style: TextStyle(color: Colors.black))
      ],
    );
  }
}

