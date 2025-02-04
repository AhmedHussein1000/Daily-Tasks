import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/local_database/database_constants.dart';

class DatabaseHelper {
  Database? database;

  Future<Database> _getDB() async {
    database ??= await _initDB();
    return database!;
  }

  Future<Database> _initDB() async {
    String dbsPath = await getDatabasesPath();
    Database db = await openDatabase(
      join(dbsPath, DatabaseConstants.tasksDatabase),
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${DatabaseConstants.tasksTable} (
        ${DatabaseConstants.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
        ${DatabaseConstants.title} TEXT, 
        ${DatabaseConstants.time} TEXT, 
        ${DatabaseConstants.date} TEXT, 
        ${DatabaseConstants.status} TEXT, 
        ${DatabaseConstants.colorValue} INTEGER
        
        )
        ''');
  }

  Future<int> insertData({
    required Map<String, dynamic> data,
  }) async {
    Database db = await _getDB();
    return await db.insert(
      DatabaseConstants.tasksTable,
      data,
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database db = await _getDB();
    return await db.query(DatabaseConstants.tasksTable );
  }

  Future<int> updateData({required int id, required Map<String,dynamic> updatedData}) async {
    Database db = await _getDB();
    return await db.update(
      DatabaseConstants.tasksTable,
     updatedData,
      where: '${DatabaseConstants.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteData({required int id}) async {
    Database db = await _getDB();
    return await db.delete(
      DatabaseConstants.tasksTable,
      where: '${DatabaseConstants.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDatabaseManually() async {
    String dbsPath = await getDatabasesPath();
    String path = join(dbsPath, DatabaseConstants.tasksDatabase);
    await deleteDatabase(path);
  }
}
