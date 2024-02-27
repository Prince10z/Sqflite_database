import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHandler {
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = join(directory.path, 'princeDatabase.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''
CREATE TABLE DatabaseTable(
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER
)
''');
        },
      );
      return _database;
    }
  }

  insertData({required String name, required int age}) async {
    Database? db = await database;
    Map<String, Object?> mapdata = {
      'id': DateTime.now().microsecondsSinceEpoch,
      'name': name,
      'age': age
    };
    print(DateTime.now().microsecondsSinceEpoch);
    final test = DateTime.now().microsecondsSinceEpoch;
    DateTime result = DateTime.fromMicrosecondsSinceEpoch(test);
    print("${test} ................${result}");
    db!.insert('DatabaseTable', mapdata);
  }

  dynamic readData() async {
    Database? db = await database;
    final listdata = await db!.query('DatabaseTable');
    return listdata;
  }
}
