import 'dart:convert';

import 'package:body_strong/Screens/FootScreens/Recipes/recipesHttp.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

//Раздел рецептов
class Recipes extends StatefulWidget {
  Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List _habList = [];

  final url = "https://api.edamam.com/search?q=chicken&app_id=8be75524&app_key=4d63dc59251f649d518f752bece54196&from=0&to=3&calories=591-722&health=alcohol-free";

  getApiData() async {
    var response = await http.get(Uri.parse(url));
    Map json = jsonDecode(response.body);
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

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
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: FutureBuilder(
            future: _getHttpRecipes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _habList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Column(
                            children: [
                              Text("${_habList[index].title}")
                            ],
                          ),
                        ),
                      );
                    }
                  )
                );
              }
            },
          )
        )
      )
    );
  }

  //Отображение продуктов в виде таблицы
  GridView _grid() {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4
      ),
      itemBuilder: (BuildContext context, int index) {
        return _inkWell();
      }
    );
  }

  Widget _inkWell() {
    return Material(
      child: InkWell(
        onTap: (){},
        child: Column(
          children: [
            Ink.image(
              image: AssetImage("assets/na-avy-parni-44.jpg"),
              height: 150,
              width: 200,
              fit: BoxFit.cover,
            ),
            Text("Кнопка")
          ]
        )
      )
    );
  }

  _getHttpRecipes() async {
    var response = await fetchHttpRecipes("https://povar.ru/rss");
    var chanel = RssFeed.parse(response.body);
    chanel.items!.forEach((element) {
      _habList.add(element);
    });
    return _habList;
  }
}
