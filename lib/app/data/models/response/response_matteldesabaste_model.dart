import 'package:appsivalmattel/app/services/database/execute_sqlite.dart';
import 'package:appsivalmattel/app/services/database/tables.dart';

class ResponseMatteldesabasteModel extends ExecuteSqlite {
  String usuarioId;
  String puntoventaId;
  String puntoventa;
  String fecha;
  String p01;
  String p02;
  String p03;
  String p04;
  String p05;
  String p06;
  String p07;
  String p08;
  String p09;
  String f01;
  String f02;
  String f03;
  String f04;
  String f05;
  String f06;
  String f07;
  String f08;
  String f09;
  String f011;
  String f021;
  String f031;
  String f041;
  String f051;
  String f061;
  String f071;
  String f081;
  String f091;
  String comentario;
  String supfecha;
  String suplatitud;
  String suplongitud;

  ResponseMatteldesabasteModel({
    this.usuarioId = "0",
    this.puntoventaId = "0",
    this.puntoventa = "",
    this.fecha = "",
    this.p01 = "",
    this.p02 = "",
    this.p03 = "",
    this.p04 = "",
    this.p05 = "",
    this.p06 = "",
    this.p07 = "",
    this.p08 = "",
    this.p09 = "",
    this.f01 = "",
    this.f02 = "",
    this.f03 = "",
    this.f04 = "",
    this.f05 = "",
    this.f06 = "",
    this.f07 = "",
    this.f08 = "",
    this.f09 = "",
    this.f011 = "",
    this.f021 = "",
    this.f031 = "",
    this.f041 = "",
    this.f051 = "",
    this.f061 = "",
    this.f071 = "",
    this.f081 = "",
    this.f091 = "",
    this.comentario = "",
    this.supfecha = "",
    this.suplatitud = "",
    this.suplongitud = "",
  }) : super(matteldesabastesTable);

  factory ResponseMatteldesabasteModel.fromJson(Map<String, dynamic> json) =>
      ResponseMatteldesabasteModel(
        usuarioId: json["usuario_id"] ?? "",
        puntoventaId: json["puntoventa_id"] ?? "",
        puntoventa: json["puntoventa"] ?? "",
        fecha: json["fecha"] ?? "",
        p01: json["p01"] ?? "",
        p02: json["p02"] ?? "",
        p03: json["p03"] ?? "",
        p04: json["p04"] ?? "",
        p05: json["p05"] ?? "",
        p06: json["p06"] ?? "",
        p07: json["p07"] ?? "",
        p08: json["p08"] ?? "",
        p09: json["p09"] ?? "",
        f01: json["f01"] ?? "", //cambiar a minuscula
        f02: json["f02"] ?? "",
        f03: json["f03"] ?? "",
        f04: json["f04"] ?? "",
        f05: json["f05"] ?? "",
        f06: json["f06"] ?? "",
        f07: json["f07"] ?? "",
        f08: json["f08"] ?? "",
        f09: json["f09"] ?? "",
        f011: json["f011"] ?? "",
        f021: json["f021"] ?? "",
        f031: json["f031"] ?? "",
        f041: json["f041"] ?? "",
        f051: json["f051"] ?? "",
        f061: json["f061"] ?? "",
        f071: json["f071"] ?? "",
        f081: json["f081"] ?? "",
        f091: json["f091"] ?? "",
        comentario: json["comentario"] ?? "",
        supfecha: json["supfecha"] ?? "",
        suplatitud: json["suplatitud"] ?? "",
        suplongitud: json["suplongitud"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "usuario_id": usuarioId,
        "puntoventa_id": puntoventaId,
        "puntoventa": puntoventa,
        "fecha": fecha,
        "p01": p01,
        "p02": p02,
        "p03": p03,
        "p04": p04,
        "p05": p05,
        "p06": p06,
        "p07": p07,
        "p08": p08,
        "p09": p09,
        "f01": f01,
        "f02": f02,
        "f03": f03,
        "f04": f04,
        "f05": f05,
        "f06": f06,
        "f07": f07,
        "f08": f08,
        "f09": f09,
        "f011": f011,
        "f021": f021,
        "f031": f031,
        "f041": f041,
        "f051": f051,
        "f061": f061,
        "f071": f071,
        "f081": f081,
        "f091": f091,
        "comentario": comentario,
        "supfecha": supfecha,
        "suplatitud": suplatitud,
        "suplongitud": suplongitud,
      };
}
