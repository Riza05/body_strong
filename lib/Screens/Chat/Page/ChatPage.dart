import 'package:body_strong/Screens/Chat/CustomUI/CustomCard.dart';
import 'package:body_strong/Screens/Chat/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel("Риза", Icons.person, false, "4:00", "Привет"),
    ChatModel("Саша", Icons.person, false, "4:00", "Как дела?"),
    ChatModel("Качалка", Icons.groups, true, "4:00", "Как дела?"),
    ChatModel("Нарек", Icons.person, false, "4:00", "Все хорошо"),
    ChatModel("Вардан", Icons.person, false, "4:00", "Шаурма вкусная")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index])
      )
    );
  }
}
