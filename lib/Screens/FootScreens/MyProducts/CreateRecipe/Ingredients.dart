import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/Confirm_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Ингредиенты
class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  List<String> name = [
    "Ингридиенты",
    "Способы приготовления",
    "Время приготовления",
    "Тип блюда",
    "Технология приготовления",
  ];

  final ingredientsEditingController = TextEditingController();
  final cookingMethodEditingController = TextEditingController();
  final cookingTimeEditingController = TextEditingController();
  final typeOfDishEditingController = TextEditingController();
  final cookingTechnologyEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                textField(ingredientsEditingController),
                textField(cookingMethodEditingController),
                textField(cookingTimeEditingController),
                textField(typeOfDishEditingController),
                textField(cookingTechnologyEditingController),
                ElevatedButton(onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString("ingredients", ingredientsEditingController.text);
                  await prefs.setString("cookingMethod", cookingMethodEditingController.text);
                  await prefs.setString("cookingTime", cookingTimeEditingController.text);
                  await prefs.setString("typeOfDish", typeOfDishEditingController.text);
                  await prefs.setString("cookingTechnology", cookingTechnologyEditingController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmIngredients()
                    )
                  );
                },child: Text("СОХРАНИТЬ"))
              ],
            ),
          ),
          ),
        )
    );
  }

  Widget textField(TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a search term',
      ),
    );
  }
}
