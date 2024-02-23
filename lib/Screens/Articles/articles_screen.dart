import 'package:flutter/material.dart';

class Articles_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const ImageIcon(AssetImage("assets/Icon/filter.png"))
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.backspace_sharp)
                  ),
                ]
              ),
            ]
          ),
        )
      )
    );
  }
}

class _List_articles extends StatelessWidget {
  const _List_articles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/na-avy-parni-44.jpg"),
                height: 200,
                width: 200
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text("jjjjjwjjw", style: TextStyle(fontSize: 26)),
              )
            ]
          )
        );
      }
    );
  }
}
