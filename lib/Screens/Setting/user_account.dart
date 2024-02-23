import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/Generate_a_image.dart';
import 'package:flutter/material.dart';

class User_account extends StatelessWidget {
  const User_account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Generate_a_image().m()),
                fit: BoxFit.cover
              )
            ),
          )
        )
      )
    );
  }
}

class _TextForm extends StatelessWidget {
  List _name_field = [
    "Имя",
    "Возраст",
    "Вес",
    "Пол",
    "Активность",
    "Рост",
    "Вес",
    "Желаемый вес",
    "Цель",
    "Логин",
    "Пароль",
    "Банковская картка",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 80),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
      return Form(
              child:
                    SizedBox(
                        height: 100,
                        width: 350,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600
                          ),
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
                              labelText: _name_field[index],
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
                      ),
        );
      }
    );
  }
}

class _DropDown extends StatefulWidget {
  const _DropDown({super.key});

  @override
  State<_DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<_DropDown> {
  List<String> names = [
    "Сидячий образ жизни",
    "Легкая активность",
    "Умеренная активность",
    "Высокая активность",
  ];

  String? selected = "Сидячий образ жизни";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButton<String>(
          value: selected,
          items: names.map((name) => DropdownMenuItem<String>(
              value: name,
              child: Text(name, style: TextStyle(fontSize: 26))
          )).toList(),
          onChanged: (name) => setState(() {
            selected = name;
          })
      ),
    );
  }
}
