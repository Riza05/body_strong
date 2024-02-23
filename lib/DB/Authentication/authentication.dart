import 'dart:convert';

import 'package:body_strong/DB/Authentication/authentication_modal.dart';
import 'package:sqflite/sqflite.dart';

class Authentication {
  Authentication._();

  static Database? _database;
  static final Authentication authentication = Authentication._();

  Authentication._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB("notes.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final nameType = "TEXT NOT NULL";
    final genderType = "TEXT NOT NULL";
    final activityType = "TEXT NOT NULL";
    final heightType = "INTEGER NOT NULL";
    final weightType = "INTEGER NOT NULL";
    final desired_weightType = "INTEGER NOT NULL";
    final purposeType = "TEXT NOT NULL";
    final loginType = "TEXT NOT NULL";
    final passwordType = "TEXT NOT NULL";

    await db.execute('''CREATE TABLE $tableNote (
    ${User_files.id} $idType,
    ${User_files.name} $nameType,
    ${User_files.gender} $genderType,
    ${User_files.activity} $activityType,
    ${User_files.height} $heightType,
    ${User_files.weight} $weightType,
    ${User_files.desired_weight} $desired_weightType,
    ${User_files.purpose} $purposeType,
    ${User_files.login} $loginType,
    ${User_files.password} $passwordType
    )
    ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;
    final id = await db.insert(tableNote, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableNote,
      columns: User_files.values,
      where: "${User_files.id} = ?",
      whereArgs: [id]
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception("ID не найден");
    }
  }

  Future<List<User>> readAllUser() async {
    final db = await instance.database;
    final orderBy = "${User_files.} ASC";
    final result = await db.query(tableNote, orderBy: orderBy);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}