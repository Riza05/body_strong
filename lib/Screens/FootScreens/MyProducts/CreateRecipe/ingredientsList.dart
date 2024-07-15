class Ingredientslist {
  String name;
  String calories;
  String squirrels;
  String fats;
  String carbohydrates;
  String ingredients;
  String cookingMethod;
  String cookingTime;
  String typeOfDish;

  Ingredientslist({
    required this.name,
    required this.calories,
    required this.squirrels,
    required this.fats,
    required this.carbohydrates,
    required this.ingredients,
    required this.cookingMethod,
    required this.cookingTime,
    required this.typeOfDish
  });

  factory Ingredientslist.fromJson(Map<String, dynamic> json) => Ingredientslist(
    name: json["name"],
    calories: json["calories"],
    squirrels: json["squirrels"],
    fats: json["fats"],
    carbohydrates: json["carbohydrates"],
    ingredients: json["ingredients"],
    cookingMethod: json["cookingMethod"],
    cookingTime: json["cookingTime"],
    typeOfDish: json["typeOfDish"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "calories": calories,
    "squirrels": squirrels,
    "fats": fats,
    "carbohydrates": carbohydrates,
    "ingredients": ingredients,
    "cookingMethod": cookingMethod,
    "cookingTime": cookingTime,
    "typeOfDish": typeOfDish,
  };
}
