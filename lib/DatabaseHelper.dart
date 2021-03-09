import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  // Create necessary variables for SQLite
  static final _databaseName = "Covwarn.db";
  static final _databaseVersion = 1;
  static final table = 'userData';

  // Column variables

  static final columnId = "id";
  static final columnCity = "city";

  //DatabaseHelper._privateConstructor();
  //static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  

  Future<Database> get database async {
    if (_database != null) return _database;
    // instantiate the db the first time it is accessed
    _database = await _initDatabase();
    
    return _database;
  }

  DatabaseHelper dbhelper = DatabaseHelper();

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnCity TEXT NOT NULL,
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row)async{
    Database db = await dbhelper.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getAllData()async{
    Database db = await dbhelper.database;
    return await db.rawQuery("select * FROM $table");
  }


}