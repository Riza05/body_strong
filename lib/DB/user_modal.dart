class UserModal {
  final int? id;
  final String name;
  final String age;
  final int height;
  final int weight;
  final int desired_weight;
  final String login;
  final String password;

  UserModal({
    this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.desired_weight,
    required this.login,
    required this.password
  });

   factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    desired_weight: json["desired_weight"],
    login: json["login"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "height": height,
    "weight": weight,
    "desired_weight": desired_weight,
    "login": login,
    "password": password,
  };
}