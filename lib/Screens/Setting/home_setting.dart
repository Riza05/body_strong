import 'package:body_strong/Screens/Setting/settings_sections/features_of_the_diet.dart';
import 'package:body_strong/Screens/Setting/settings_sections/invite_a_friend.dart';
import 'package:body_strong/Screens/Setting/settings_sections/support.dart';
import 'package:body_strong/Screens/Setting/settings_sections/user_account.dart';
import 'package:body_strong/Screens/Widgets/Generate_a_image.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class Home_setting extends StatefulWidget {
  Home_setting({super.key});

  List<Widget> widget = [
    User_account(),
    FeaturesOfTheDiet(),
    InviteFriend(),
    Support()
  ];

  @override
  State<Home_setting> createState() => _Home_settingState();
}

class _Home_settingState extends State<Home_setting> {
  List _settings = [
    "Личные данные",
    "Особенности рациона",
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
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg")
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text("Настройки", style: TextStyle(
                  fontSize: 38,
                  color: Color(0xFFFAFF00)
                )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _settings.length,
                  itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => widget.widget[index]
                                )
                              );
                            },
                            child: Text(_settings[index], style: TextStyle(
                              fontSize: 26,
                            )),
                          ),
                        ),
                      );
                  }
                ),
              ),
            ],
          )
        )
      )
    );
  }
}
