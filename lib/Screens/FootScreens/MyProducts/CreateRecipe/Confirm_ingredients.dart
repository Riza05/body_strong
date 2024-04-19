import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmIngredients extends StatefulWidget {
  const ConfirmIngredients({super.key});

  @override
  State<ConfirmIngredients> createState() => _ConfirmIngredientsState();
}

class _ConfirmIngredientsState extends State<ConfirmIngredients> {
  var ingredients = "";
  var cookingMethod = "";
  var cookingTime = "";
  var typeOfDish = "";
  var cookingTechnology = "";

  @override
  void initState() {
    getSaveData();
    super.initState();
  }

  getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    ingredients = prefs.getString("ingredients")!;
    cookingMethod = prefs.getString("cookingMethod")!;
    cookingTime = prefs.getString("cookingTime")!;
    typeOfDish = prefs.getString("typeOfDish")!;
    cookingTechnology = prefs.getString("cookingTechnology")!;
    setState(() {

    });
  }

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Text(ingredients),
              Text(cookingMethod),
              Text(cookingTime),
              Text(typeOfDish),
              Text(cookingTechnology),
            ],
          )
        )
      )
    );
  }
}
