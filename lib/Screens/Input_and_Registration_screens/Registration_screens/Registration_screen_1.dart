import 'package:body_strong/DB/db_modal.dart';
import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_1 extends StatelessWidget {
  String nav = "/Registration_screen_2";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Model(
        textPrecent: '0%',
        percent: 0.0,
        nameScreen: 'Как вас зовут?',
        widget: _TextField(),
        con: context,
        nav: "/Registration_screen_2",
      )
    );
  }
}

class _TextField extends StatelessWidget {
  DatabaseHelp databaseHelp = DatabaseHelp as DatabaseHelp;
  String name = "";
  _TextField({super.key});
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
              initialValue: name,
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
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_GlobalKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                }
              },
              child: const Text('Submit'),
            ),]
        ),
      )
    );
  }
}



