import 'package:appsivalmattel/app/services/database/execute_sqlite.dart';
import 'package:appsivalmattel/app/services/database/tables.dart';

class ResponsePuntoventaModel extends ExecuteSqlite {
  int id;
  String nombre;
  int clienteId;
  int distribuidoraId;
  String idcadena;
  String idgrupo;
  String direccion;
  String clientenom;
  String mercaderista;
  String impulso;
  String latitud;
  String longitud;
  String zona;
  int estadoId;

  ResponsePuntoventaModel({
    this.id = 0,
    this.nombre = "",
    this.clienteId = 0,
    this.distribuidoraId = 0,
    this.idcadena = "",
    this.idgrupo = "",
    this.direccion = "",
    this.clientenom = "",
    this.mercaderista = "",
    this.impulso = "",
    this.latitud = "",
    this.longitud = "",
    this.zona = "",
    this.estadoId = 0,
  }) : super(puntoventasTable);

  factory ResponsePuntoventaModel.fromJson(Map<String, dynamic> json) =>
      ResponsePuntoventaModel(
        id: json["id"],
        nombre: json["nombre"],
        clienteId: json["cliente_id"],
        distribuidoraId: json["distribuidora_id"],
        idcadena: json["idcadena"],
        idgrupo: json["idgrupo"],
        direccion: json["direccion"],
        clientenom: json["clientenom"],
        mercaderista: json["mercaderista"],
        impulso: json["impulso"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        zona: json["zona"],
        estadoId: json["estado_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "cliente_id": clienteId,
        "distribuidora_id": distribuidoraId,
        "idcadena": idcadena,
        "idgrupo": idgrupo,
        "direccion": direccion,
        "clientenom": clientenom,
        "mercaderista": mercaderista,
        "impulso": impulso,
        "latitud": latitud,
        "longitud": longitud,
        "zona": zona,
        "estado_id": estadoId,
      };
}
