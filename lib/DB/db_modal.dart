import 'dart:io';

import 'package:body_strong/DB/user_modal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelp {
  DatabaseHelp._privateConstructor();
  static final DatabaseHelp instance = DatabaseHelp._privateConstructor();

  static final _dbName = "BodyStrong.db";
  static final _dbVersion = 1;
  static final _tableName = "User";
  static final columnId = "_id";
  static final columnName = "name";
  static final columnAge = "age";
  static final columnHeight = "height";
  static final columnWeight = "weight";
  static final columnDesiredWeight = "desiredWeight";
  static final columnLogin = "login";
  static final columnPassword = "password";

  static Database? _database;
  Future<Database> get database async {
    if (database != null) {
      return _database!;
    } else
      _database = await _initiateDatabase();
      return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.execute(
      '''
      CREATE TABLE $_tableName(
      $columnId INTEGER NOT NULL PRiMARY KEY,
      $columnName TEXT NOT NULL,
      $columnAge INTEGER NOT NULL,
      $columnHeight INTEGER NOT NULL,
      $columnWeight INTEGER NOT NULL,
      $columnDesiredWeight INTEGER NOT NULL,
      $columnDesiredWeight INTEGER NOT NULL,
      $columnLogin TEXT NOT NULL,
      $columnPassword TEXT NOT NULL,
      )
      '''
    );
  }

  Future<int> insert(Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String,dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(_tableName, row, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: "$columnId = ?", whereArgs: [id]);
  }
}
