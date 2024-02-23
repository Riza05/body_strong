import 'package:body_strong/Screens/Input_and_Registration_screens/Registration_screens/Model.dart';
import 'package:flutter/material.dart';

class Registration_screen_8 extends StatelessWidget {
  const Registration_screen_8({super.key});

  @override
  Widget build(BuildContext context) {
    return Model(
        textPrecent: "100%",
        percent: 1,
        nameScreen: "Какой у вас инвентарь?",
        widget: _List_block(),
        con: context,
        nav: "/Registration_screen_9");
  }
}

class _List_block extends StatelessWidget {
  const _List_block({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 11,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
              children: [
                Image(image: AssetImage("assets/na-avy-parni-44.jpg"),height: 200, width: 200,),
                Text("Гантели", style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFFFAFF00)
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled_outlined, size: 45))
              ]
          ),
        );
      }
    );
  }
}


class _Inventory_block extends StatelessWidget {
  const _Inventory_block({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image(image: AssetImage("assets/na-avy-parni-44.jpg"),height: 200, width: 200,),
          Text("Гантели", style: TextStyle(
            fontSize: 26,
            color: Color(0xFFFAFF00)
          )),
          IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled_outlined, size: 45))
        ]
      ),
    );
  }
}

