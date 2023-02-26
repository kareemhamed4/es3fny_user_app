import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "familyInfo.db");
    Database myDb =
        await openDatabase(path, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "family" (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
      "name" TEXT NOT NULL ,
      "phone" TEXT NOT NULL ,
      "nickname" TEXT
      )
    ''');
    debugPrint("Create DATABASE and Table SUCCESS =====================");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    debugPrint("Upgrade DATABASE SUCCESS =====================");
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }
}
