import 'package:appsivalmattel/app/services/database/db.dart';
import 'package:sqflite/sqflite.dart';

class ExecuteSqlite {
  String table;
   ExecuteSqlite(this.table);

  //abrir la conexion a la bd
  Future<Database> get database async{
    return await Db.openDB();
  }

  //crear los querys
  create(Map<String, dynamic> data) async{
    return (await database).insert(
      table,
      data,
    );
  }

  query(String where, {List arguments = const []}) async{
    return(await database).rawQuery("SELECT * FROM $table $where", arguments);
  }

  deleteAll() async{
    return(await database).rawQuery("DELETE FROM $table ");
  }
  
}