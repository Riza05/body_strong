final String tableNote = "notes";

class User_files {
  static final List<String> values = [
    id,
    name,
    gender,
    activity,
    height,
    weight,
    desired_weight,
    purpose,
    login,
    password
  ];

  static final String id = "_id";
  static final String name = "name";
  static final String gender = "gender";
  static final String activity = "activity";
  static final String height = "height";
  static final String weight = "weight";
  static final String desired_weight = "desired_weight";
  static final String purpose = "purpose";
  static final String login = "login";
  static final String password = "password";
}

class User {
  final int? id;
  final String name;
  final String gender;
  final String activity;
  final int height;
  final int weight;
  final int desired_weight;
  final String purpose;
  final String login;
  final String password;


  const User({
    this.id,
    required this.name,
    required this.gender,
    required this.activity,
    required this.height,
    required this.weight,
    required this.desired_weight,
    required this.purpose,
    required this.login,
    required this.password
  });

  static User fromJson(Map<String, Object?> json) =>User(
      id: json[User_files.id] as int?,
      name: json[User_files.name] as String,
      gender: json[User_files.gender] as String,
      activity: json[User_files.activity] as String,
      height: json[User_files.height] as int,
      weight: json[User_files.weight] as int,
      desired_weight: json[User_files.desired_weight] as int,
      purpose: json[User_files.purpose] as String,
      login: json[User_files.login] as String,
      password: json[User_files.password] as String
  );

  Map<String, Object?> toJson() => {
    User_files.id: id,
    User_files.name: name,
    User_files.gender: gender,
    User_files.activity: activity,
    User_files.height: height,
    User_files.weight: weight,
    User_files.desired_weight: desired_weight,
    User_files.purpose: purpose,
    User_files.login: login,
    User_files.password: password,
  };

  User copy({
    int? id,
    String? name,
    String? gender,
    String? activity,
    int? height,
    int? weight,
    int? desired_weight,
    String? purpose,
    String? login,
    String? password,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    gender: gender ?? this.gender,
    activity: activity ?? this.activity,
    height: height ?? this.height,
    weight: weight ?? this.weight,
    desired_weight: desired_weight ?? this.desired_weight,
    purpose: purpose ?? this.purpose,
    login: login ?? this.login,
    password: password ?? this.password,
  );
}