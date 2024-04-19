class Users {
  final int? id;
  final String name;
  /*final int? age;
  final bool? gender;
  final bool? activity;
  final int? height;
  final int? weight;
  final int? desiredWeight;
  final bool? purpose;
  final String? login;*/
  final String password;

  Users({
    this.id,
    required this.name,
    /*this.age,
    this.gender,
    this.activity,
    this.height,
    this.weight,
    this.desiredWeight,
    this.purpose,
    this.login,*/
    required this.password,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    /*age: json["age"],
    gender: json["gender"],
    activity: json["activity"],
    height: json["height"],
    weight: json["weight"],
    desiredWeight: json["desired_weight"],
    purpose: json["purpose"],
    login: json["login"],*/
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    /*"age": age,
    "gender": gender,
    "activity": activity,
    "height": height,
    "weight": weight,
    "desired_weight": desiredWeight,
    "purpose": purpose,
    "login": login,*/
    "password": password,
  };
}
