import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHandler {
  static DbHandler dbHandler = DbHandler();
  Database? database;

  Future<Database?> checkDb() async {
    if (database != null) {
      return database;
    } else {
      return await createDb();
    }
  }

  Future<Database> createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'parth.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE quotes (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,quote TEXT,author TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertData(
      {required String category,
      required String quote,
      required String author}) async {
    database = await checkDb();
    database!.insert(
      "quotes",
      {
        "category": category,
        "quote": quote,
        "author": author,
      },
    );
  }

  Future<List<Map>> readData() async {
    database = await checkDb();
    String query = "SELECT * FROM quotes";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> deleteData({required int id}) async {
    database = await checkDb();
    database!.delete(
      "quotes",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateData({
    required int id,
    required String category,
    required String quote,
    required String author,
  }) async {
    database = await checkDb();
    database!.update(
      "quotes",
      {"category": category, "quote": quote, "author": author},
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
