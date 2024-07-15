import 'package:flutter/material.dart';

//Раздел рецептов
class Recipes extends StatefulWidget {
  Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {

  String a = "https://api.edamam.com/search?q=chicken&app_id=8be75524&app_key=60fcbf827ab5bf769b357767691e09bd&from=0&to=3&calories=591-722&health=alcohol-free";

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
          child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Column(
                            children: [
                            ],
                          ),
                        ),
                      );
                    }
                  )
                )
    )
    )
    );
  }

  //Отображение продуктов в виде таблицы
  /*GridView _grid() {
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
  }*/

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
}
