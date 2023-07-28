// definir nombre de la tabla
const String usuariosTable = "usuarios";
const String puntoventasTable = "puntoventas";
const String distribuidorasTable = "distribuidoras";
const String matteldesabastesTable = "matteldesabastes";

//Cargar lista con estructura de tablas
List get tables => [
      _createTable(
        usuariosTable,
        "id INTEGER,"
        "grupo_id INTEGER,"
        "nombre TEXT,"
        "email TEXT,"
        "password TEXT,"
        "telefono TEXT,"
        "cliente_id INTEGER,"
        "tipousuario_id INTEGER",
      ),
      _createTable(
          puntoventasTable,
          "id INTEGER,"
          "nombre TEXT,"
          "cliente_id INTEGER,"
          "distribuidora_id INTEGER,"
          "idcadena TEXT,"
          "idgrupo TEXT,"
          "direccion TEXT,"
          "clientenom TEXT,"
          "mercaderista TEXT,"
          "impulso TEXT,"
          "latitud TEXT,"
          "longitud TEXT,"
          "zona TEXT,"
          "estado_id INTEGER"),
      _createTable(
          distribuidorasTable,
          "id INTEGER,"
          "nombre TEXT"),
      _createTable(
          matteldesabastesTable,
          "usuario_id TEXT,"
          "puntoventa_id TEXT,"
          "puntoventa TEXT,"
          "fecha TEXT,"
          "p01 TEXT,"
          "p02 TEXT,"
          "p03 TEXT,"
          "p04 TEXT,"
          "p05 TEXT,"
          "p06 TEXT,"
          "p07 TEXT,"
          "p08 TEXT,"
          "p09 TEXT,"
          "F01 TEXT,"
          "f02 TEXT,"
          "f03 TEXT,"
          "f04 TEXT,"
          "f05 TEXT,"
          "f06 TEXT,"
          "f07 TEXT,"
          "f08 TEXT,"
          "f09 TEXT,"
          "f011 TEXT,"
          "f021 TEXT,"
          "f031 TEXT,"
          "f041 TEXT,"
          "f051 TEXT,"
          "f061 TEXT,"
          "f071 TEXT,"
          "f081 TEXT,"
          "f091 TEXT,"
          "comentario TEXT,"
          "supfecha TEXT,"
          "suplatitud TEXT,"
          "suplongitud TEXT "),
    ];

_createTable(String table, String columns) {
  return "CREATE TABLE IF NOT EXISTS $table ($columns)";
}
