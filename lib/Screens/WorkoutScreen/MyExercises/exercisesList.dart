class Exerciseslist {
  String title;
  String description;
  String warning;

  Exerciseslist({required this.title, required this.description, required this.warning});

  factory Exerciseslist.fromJson(Map<String, dynamic> json) => Exerciseslist(
    title: json["title"],
    description: json["description"],
    warning: json["warning"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "warning": warning,
  };
}