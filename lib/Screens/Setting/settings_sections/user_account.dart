import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(_U(), "Личные данные");
  }
}

class _U extends StatefulWidget {
  @override
  State<_U> createState() => _UState();
}

class _UState extends State<_U> {
  TextEditingController nameControlle = TextEditingController();
  var name = "";

  @override
  void initState() {
    getS();
    super.initState();
  }

  getS() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString("username")!;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    List _name_field = [
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
      "Банковская картка",
    ];

    return ListView(
      children: [
        form(_name_field[0]),
        /*form(_name_field[1]),
        form(_name_field[2]),
        form(_name_field[3]),
        checkBox(_name_field[4]),
        checkBox(_name_field[5]),
        checkBox(_name_field[6]),
        form(_name_field[7]),
        form(_name_field[8]),
        form(_name_field[9]),
        form(_name_field[10]),*/
        btn(),
        Text(name, style: TextStyle(
          color: Colors.white
        ))
      ],
    );
  }

  Widget form(String a) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Form(
        child: TextFormField(
            controller: nameControlle,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
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
              labelText: a,
              labelStyle: const TextStyle(fontSize: 26, color: Colors.black),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ),
    );
  }

  Widget checkBox(String checkBox) {
    int _selectedValue = 0;
    List<String> text = <String>[
      "Муж",
      "Жен",
    ];
    return Column(
      children: [
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[0],
              style: const TextStyle(fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 1,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 1;
              }
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(text[1],
              style: const TextStyle(fontSize: 26, color: Color(0xFFFAFF00))),
          value: _selectedValue == 2,
          checkColor: Colors.black,
          activeColor: const Color(0xFFFAFF00),
          onChanged: (value) {
            setState(() {
              if (value!) {
                _selectedValue = 2;
              }
            });
          },
        )
      ],
    );
  }

  Widget btn() {
    return ElevatedButton(
      onPressed: () async {
        final pref = await SharedPreferences.getInstance();
        await pref.setString("username", nameControlle.text);
      },
      child: Text("Добавить")
    );
  }
}
