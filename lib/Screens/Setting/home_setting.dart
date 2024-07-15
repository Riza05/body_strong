import 'package:body_strong/Screens/Setting/settings_sections/user_account.dart';
import 'package:body_strong/Screens/Setting/settings_sections/features_of_the_diet.dart';
import 'package:body_strong/Screens/Setting/settings_sections/invite_a_friend.dart';
import 'package:body_strong/Screens/Setting/settings_sections/notification_of_reminders.dart';
import 'package:body_strong/Screens/Setting/settings_sections/subscription.dart';
import 'package:body_strong/Screens/Setting/settings_sections/support.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSetting extends StatelessWidget {
  HomeSetting({super.key});

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

  List <IconData> icons = [
    Icons.account_circle,
    Icons.no_meals_sharp,
    Icons.no_meals_sharp,
    Icons.notification_add,
    Icons.no_meals_sharp,
    Icons.support_agent,
    Icons.support_agent,
  ];

  List<Widget> wid = [
    UserAccount(),
    FeaturesOfTheDiet(),
    Subscription(),
    NotificationOfReminders(),
    InviteAFriend(),
    Support(),
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
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Icon(icons[index], color: Colors.white),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => wid[index]));
                                    },
                                    child: Text(_settings[index], style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                    ))),
                                ],
                              ),
                            ),
                          ),
                          Divider()
                        ],
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
