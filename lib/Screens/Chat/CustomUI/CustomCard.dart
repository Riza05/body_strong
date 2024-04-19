import 'package:body_strong/Screens/Chat/IndividualPage.dart';
import 'package:body_strong/Screens/Chat/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: chatModel.isGroup? Icon(Icons.groups, size: 30) : Icon(Icons.person),
              backgroundColor: Color(0xFFFAFF00),
            ),
            title: Text(chatModel.name, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            )),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3),
                Text(chatModel.currentMessage, style: TextStyle(
                  fontSize: 13
                )),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
