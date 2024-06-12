import 'package:flutter/material.dart';

class Product_screen extends StatelessWidget {
  const Product_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: const Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/na-avy-parni-44.jpg")
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text("Яйца", style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFFFAFF00)
                ))
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: _Nutrients(),
                )
              )
            ]
          )
        )
      )
    );
  }
}

class _Nutrients extends StatelessWidget {
  const _Nutrients({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 21,
      itemBuilder: (BuildContext contex, int index) {
        return const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Калории", style: TextStyle(
                fontSize: 26
              )),
              Text("220", style: TextStyle(
                fontSize: 26
              ))
            ]
          ),
        );
      }
    );
  }
}
