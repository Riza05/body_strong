class Ingredientslist {
  String ingredients;
  String cookingMethod;
  String cookingTime;
  String typeOfDish;
  String cookingTechnology;

  Ingredientslist({required this.ingredients, required this.cookingMethod, required this.cookingTime,
      required this.typeOfDish, required this.cookingTechnology});

  factory Ingredientslist.fromJson(Map<String, dynamic> json) => Ingredientslist(
    ingredients: json["ingredients"],
    cookingMethod: json["cookingMethod"],
    cookingTime: json["cookingTime"],
    typeOfDish: json["typeOfDish"],
    cookingTechnology: json["cookingTechnology"],
  );

  Map<String, dynamic> toJson() => {
    "ingredients": ingredients,
    "cookingMethod": cookingMethod,
    "cookingTime": cookingTime,
    "typeOfDish": typeOfDish,
    "cookingTechnology": cookingTechnology,
  };
}
