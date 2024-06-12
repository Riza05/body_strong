import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  final formKey = GlobalKey<FormState>();
  final ell = TextEditingController();

  String a = "";
  String b = "";
  String c = "";

  List listController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final List<String> musculGroups = [
    "Вес",
    "Шея",
    "Плечи",
    "Грудь",
    "Бицепс",
    "Предплечья",
    "Спина",
    "Талия",
    "Ягодицы",
    "Бедра",
    "Голень",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: musculGroups.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(.2)),
                          child: TextFormField(
                            controller: listController[index],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Поле не должно быть пустым";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Название",
                                hintStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                        );
                      }
                  )
                ),
                Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final String a = listController[0].text;
                            final String b = listController[1].text;
                            final String c = listController[2].text;
                          }
                        },
                        child: const Text("Войти", style: TextStyle(
                            fontSize: 20
                        )
                    )
                  )
                ),
              ],
            )
          )
        )
      )
    );
  }
}