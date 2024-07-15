import 'package:flutter/material.dart';

class Articles_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.filter_list_alt)
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 80),
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Image(
                      height: 200,
                      width: 200,
                      image: AssetImage("assets/na-avy-parni-44.jpg")),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text("KKKKKKK", style: TextStyle(
                        fontSize: 26,
                      ))
                    )
                  ],
                ),
              );
            }
          ),
        )
      )
    );
  }
}
