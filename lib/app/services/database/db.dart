import 'package:sqflite/sqflite.dart';
import 'package:appsivalmattel/app/services/database/tables.dart';
import 'package:path/path.dart';

abstract class Db {
  static String name = "mattelDb";
  static int version = 1;

  static Future<Database> openDB() async {
    //definir donde crear la bd
    String path = join(await getDatabasesPath(), name);
    print(path);
    //Crear la BD
    return await openDatabase(
      path,
      version: version,
      onCreate: _onCreate,
    );
  }

  static _onCreate(Database db, int version) async {
    for (var script in tables) {
      await db.execute(script);
    }
  }
}
