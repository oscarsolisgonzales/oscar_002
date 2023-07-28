import 'package:appsivalmattel/app/services/database/execute_sqlite.dart';
import 'package:appsivalmattel/app/services/database/tables.dart';

class ResponseUsuarioModel extends ExecuteSqlite {
  int id;
  int grupoId;
  String nombre;
  String email;
  String password;
  String telefono;
  int clienteId;
  int tipousuarioId;

  ResponseUsuarioModel({
    this.id = 0,
    this.grupoId = 0,
    this.nombre = "",
    this.email = "",
    this.password = "",
    this.telefono = "",
    this.clienteId = 0,
    this.tipousuarioId = 0,
  }) : super(usuariosTable);

  factory ResponseUsuarioModel.fromJson(Map<String, dynamic> json) =>
      ResponseUsuarioModel(
        id: json["id"],
        grupoId: json["grupo_id"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        telefono: json["telefono"],
        clienteId: json["cliente_id"],
        tipousuarioId: json["tipousuario_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "grupo_id": grupoId,
        "nombre": nombre,
        "email": email,
        "password": password,
        "telefono": telefono,
        "cliente_id": clienteId,
        "tipousuario_id": tipousuarioId,
      };
}
