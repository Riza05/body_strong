import 'dart:convert';
import 'package:body_strong/Screens/Articles/articles_information.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Страница со статьями
class ArticlesTemplateJson extends StatefulWidget {

  @override
  State<ArticlesTemplateJson> createState() => _ArticlesTemplateJsonState();
}

class _ArticlesTemplateJsonState extends State<ArticlesTemplateJson> {
  List<dynamic> _articles = [];

  Future<void> readJsonFile() async {
    final String response = await rootBundle.loadString("assets/Json_fiels/Articles.json");
    final data = await jsonDecode(response);
    setState(() {
      _articles = data["articles"];
    });
  }

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Поиск"
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {

          });
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.backspace)),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: _articles.isNotEmpty ? Expanded(
                child: ListView.builder(
                  itemCount: _articles.length,
                  itemBuilder: (context, index) {
                    return index == 0 ? _searchBar() : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(_articles[index]["img"]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArticlesInformation(
                                        image: _articles[index]["img"],
                                        description: _articles[index]["description"]
                                      )
                                    )
                                  );
                                },
                                child: Text(_articles[index]["name"])
                              ),
                            ),
                        ],
                      ),
                    );
                  }
                )
              ) : Container()
          ),
        )
    );
  }
}
