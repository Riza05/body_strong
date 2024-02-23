import 'package:body_strong/Screens/%D0%A1ommon_widgets_screens/Generate_a_image.dart';
import 'package:flutter/material.dart';

class Home_setting extends StatelessWidget {
  Home_setting({super.key});
  List _settings = [
    "Личные данные",
    "Особенности рациона",
    "Учетная запись",
    "Подписка",
    "Уведомление",
    "Пригласи друга",
    "Промокод",
    "Поддержка",
    "Часто задаваемые вопросы",
    "О нас"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Generate_a_image().m())
            ),
          ),
          child: ListView.builder(
            itemCount: _settings.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(_settings[index], style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFFFAFF00)
                    )),
                  ),
                ),
              );
            }
          )
        )
      )
    );
  }
}
