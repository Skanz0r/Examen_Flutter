import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

Future<Database> openDataBase() async {
  final DatabasePath = await getDatabasesPath();
  final path = join(DatabasePath, 'animaux.db');
  return openDatabase(path, version: 1, onCreate: (db, version) async{
    await db.execute('''
      CREATE TABLE type_animaux (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        espece TEXT NOT NULL
      )
    ''');
  });
}
