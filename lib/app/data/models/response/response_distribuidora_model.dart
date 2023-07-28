import 'package:appsivalmattel/app/services/database/execute_sqlite.dart';
import 'package:appsivalmattel/app/services/database/tables.dart';

class ResponseDistribuidoraModel extends ExecuteSqlite {
  int id;
  String nombre;

  ResponseDistribuidoraModel({
    this.id = 0,
    this.nombre = "",
  }) : super(distribuidorasTable);

  factory ResponseDistribuidoraModel.fromJson(Map<String, dynamic> json) =>
      ResponseDistribuidoraModel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
      };
}
