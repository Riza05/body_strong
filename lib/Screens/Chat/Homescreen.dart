import 'package:body_strong/Screens/Chat/Page/ChatPage.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BODY STRONG"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Text("Новая группа"), value: "Новая группа"),
                PopupMenuItem(
                    child: Text("New broadcast"), value: "New broadcast"),
                PopupMenuItem(
                    child: Text("Body strong web"), value: "Body strong web"),
                PopupMenuItem(
                    child: Text("Starred messages"), value: "Starred message"),
                PopupMenuItem(child: Text("Настройки"), value: "Настройки"),
              ];
            })
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera),
              ),
              Tab(text: "Чаты"),
              Tab(text: "Статус"),
              Tab(text: "Звонить"),
            ],
          ),
        ),
        body: TabBarView(controller: _controller, children: [
          Text("камера"),
          ChatPage(),
          Text("статус"),
          Text("Звонок"),
        ]),
      ),
    );
  }
}
