import 'package:body_strong/Screens/Setting/settings_sections/setting_sections_template.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Support extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SettingSectionTemplate(icon(), "Поддержка");
  }
  
  Widget icon() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: IconButton(
              onPressed: (){},
              icon: const Image(image: AssetImage("assets/Icon/icon_whatsapp.png"))
            ),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: IconButton(
              onPressed: (){},
              icon: const Image(image: AssetImage("assets/Icon/icon_telegram.png"))
            ),
          ),
          FloatingActionButton(onPressed: (){}, child: Icon(Icons.send),)
        ],
      ),
    );
  }
}
