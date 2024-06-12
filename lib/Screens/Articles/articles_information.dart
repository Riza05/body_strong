import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

//Страница с конкретной темой
class ArticlesInformation extends StatefulWidget {
  const ArticlesInformation({
    required this.image,
    required this.description
  });

  final String image;
  final String description;

  @override
  State<ArticlesInformation> createState() => _ArticlesInformationState();
}

class _ArticlesInformationState extends State<ArticlesInformation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
          appBar: ThemeColorAndfont().backScreen(context),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                    fit: BoxFit.cover)
              ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
                    children: [
                      Image(image: AssetImage(widget.image)),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                            child: Text(widget.description,
                              style: TextStyle(
                                color: Colors.white, fontSize: 18)
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }
}
