import 'package:flutter/cupertino.dart';

class ChatModel{
  String name;
  IconData icon;
  bool isGroup;
  String time;
  String currentMessage;
  ChatModel(
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage
  );
}