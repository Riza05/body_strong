import 'package:body_strong/Screens/Profil/profil_sreens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTape extends StatefulWidget {
  const HomeTape({super.key});

  @override
  State<HomeTape> createState() => _HomeTapeState();
}

class _HomeTapeState extends State<HomeTape> {
  ImageProvider imageProvider = AssetImage("assets/Icon/heart (1).png");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Center(child: Text("Лента")),
            leading: BackButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: const Color(0xFFFAFF00)
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));
              }, icon: Icon(Icons.account_circle))
            ],
            backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Риза Мисриханов",
                              style: TextStyle(
                                  fontSize: 16
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Image(
                        image: AssetImage("assets/na-avy-parni-44.jpg")),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                            InkWell(
                              onTap: (){
                                if (imageProvider == AssetImage("assets/Icon/heart (1).png")) {
                                  setState(() {
                                    imageProvider = AssetImage("assets/Icon/heart.png");
                                  });
                                } else if (imageProvider == AssetImage("assets/Icon/heart.png")) {
                                  setState(() {
                                    imageProvider = AssetImage("assets/Icon/heart (1).png");
                                  });
                                }
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image(image: imageProvider)),
                            )
                          ],
                        )
                  ],
                ),
              ),
            );
          }
        )
      ),
    );
  }
}
