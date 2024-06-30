class Traninglist {
  String name;

  Traninglist({required this.name});

  factory Traninglist.fromJson(Map<String, dynamic> json) => Traninglist(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}