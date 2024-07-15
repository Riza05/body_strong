import 'dart:convert';
import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/Ingredients.dart';
import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/individualPageMyRecept.dart';
import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/ingredientsList.dart';
import 'package:body_strong/Screens/FootScreens/homeFood.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmIngredients extends StatefulWidget {
  const ConfirmIngredients({super.key});

  @override
  State<ConfirmIngredients> createState() => _ConfirmIngredientsState();
}

class _ConfirmIngredientsState extends State<ConfirmIngredients> {
  List<Ingredientslist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("ingredientsList");
    if(strList != null) {
      list = strList.map((item) => Ingredientslist.fromJson(json.decode(item))).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.backspace), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeFoot()));
              }
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                    fit: BoxFit.cover
                  )
              ),
              child: list.isNotEmpty ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 40,
                                height: 350,
                                child: Card(
                                  semanticContainer: true,
                                  // Implement InkResponse
                                  child: InkResponse(
                                    containedInkWell: true,
                                    highlightShape: BoxShape.rectangle,
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPagemyRecept(a: list[index].calories,data: [
                                        list[index].name,
                                        list[index].squirrels,
                                        list[index].fats,
                                        list[index].carbohydrates,
                                        list[index].ingredients,
                                        list[index].cookingMethod,
                                        list[index].cookingTime,
                                        list[index].typeOfDish
                                      ]))
                                      );
                                    },
                                    // Add image & text
                                    child: Column(
                                      children: [
                                        Ink.image(
                                            width: double.infinity,
                                            height: 175,
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/na-avy-parni-44.jpg")),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              height: 167,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Text(list[index].name,
                                                          softWrap: false,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 26,
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                            ),
                                                        ),
                                                        Text("калл: ${list[index].calories}", style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        )),
                                                        Text("Белки: ${list[index].squirrels}"),
                                                        Text("Жиры: ${list[index].fats}"),
                                                        Text("Углеводы: ${list[index].carbohydrates}"),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: IconButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            list.remove(list[index]);
                                                            List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                                                            sharedPreferences.setStringList("ingredientsList", strList);
                                                          });
                                                        },
                                                        icon: Icon(Icons.delete, color: Colors.red,size: 30)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                        /*ElevatedButton(onPressed: () {
                          setState(() async {
                            const MyExercises();
                            final prefs = await SharedPreferences.getInstance();
                            prefs.remove("title");
                            prefs.remove("description");
                            prefs.remove("warning");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyExercises()));
                          });
                        }, child: const Text("удалить")),*/
                      ]
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Ваши рецепты", style: TextStyle(
                          fontSize: 38
                      )),
                      const SizedBox(height: 40),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: const Text("Сохраняйте ваши рецепты и используйте их", style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),textAlign: TextAlign.center,),
                      ),
                      const SizedBox(height: 40),
                    ],
                  )
          ),
        floatingActionButton:
            SizedBox(
              height: 60,
              width: 60,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () async {
                    String refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => Ingredients()));
                    if(refresh == "loadData") {
                      setState(() {
                        getData();
                      });
                    }
                  },
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
      )
    );
  }
}
