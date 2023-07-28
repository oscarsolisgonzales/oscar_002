import 'dart:io';

import 'package:appsivalmattel/app/data/models/response/response_matteldesabaste_model.dart';
import 'package:appsivalmattel/app/data/models/resquest/request_matteldesabaste_model.dart';
import 'package:appsivalmattel/app/data/providers/matteldesabaste_provider.dart';
//import 'package:appsivalmattel/app/routes/routes_name.dart';
//import 'package:appsivalmattel/app/ui/components/spinner.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  @override
  void onInit() {
    inicialize();
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  //Instance
  MatteldesabasteProvider _provider = MatteldesabasteProvider();
  //Variables

  //Funciones

  void inicialize() async {}

  doSave() async {
    try {
      //1.- Obtener información de la BD local
      final dataSQLITE = await ResponseMatteldesabasteModel().query("");
      final results = (dataSQLITE as List)
          .map((data) => ResponseMatteldesabasteModel.fromJson(data))
          .toList();
      //2.- Guardar los registros en el servidor
      for (ResponseMatteldesabasteModel item in results) {
        final supfecha = DateTime.parse(item.supfecha);
        // ignore: unused_local_variable
        await _provider.save(
          RequestMatteldesabasteModel(
            usuarioId: item.usuarioId,
            puntoventaId: item.puntoventaId,
            puntoventa: item.puntoventa,
            fecha: item.fecha,
            p01: item.p01,
            p02: item.p02,
            p03: item.p03,
            p04: item.p04,
            p05: item.p05,
            p06: item.p06,
            p07: item.p07,
            p08: item.p08,
            p09: item.p09,
            f01: (item.f01 != "" ? item.f01.split('/').last : ""),
            f02: (item.f02 != "" ? item.f02.split('/').last : ""),
            f03: (item.f03 != "" ? item.f03.split('/').last : ""),
            f04: (item.f04 != "" ? item.f04.split('/').last : ""),
            f05: (item.f05 != "" ? item.f05.split('/').last : ""),
            f06: (item.f06 != "" ? item.f06.split('/').last : ""),
            f07: (item.f07 != "" ? item.f07.split('/').last : ""),
            f08: (item.f08 != "" ? item.f08.split('/').last : ""),
            f09: (item.f09 != "" ? item.f09.split('/').last : ""),
            f011: (item.f011 != "" ? item.f011.split('/').last : ""),
            f021: (item.f021 != "" ? item.f021.split('/').last : ""),
            f031: (item.f031 != "" ? item.f031.split('/').last : ""),
            f041: (item.f041 != "" ? item.f041.split('/').last : ""),
            f051: (item.f051 != "" ? item.f051.split('/').last : ""),
            f061: (item.f061 != "" ? item.f061.split('/').last : ""),
            f071: (item.f071 != "" ? item.f071.split('/').last : ""),
            f081: (item.f081 != "" ? item.f081.split('/').last : ""),
            f091: (item.f091 != "" ? item.f091.split('/').last : ""),
            comentario: item.comentario,
            supfecha:
                "${supfecha.year.toString().padLeft(4, '0')}${supfecha.month.toString().padLeft(2, '0')}${supfecha.day.toString().padLeft(2, '0')}_${supfecha.hour.toString().padLeft(2, '0')}${supfecha.minute.toString().padLeft(2, '0')}${supfecha.second.toString().padLeft(2, '0')}",
            suplatitud: item.suplatitud,
            suplongitud: item.suplongitud,
          ),
        );

        //3.- Subir todas las imagenes
        Map<String, dynamic> file = {
          //FOTO PREGUNTA 1
          "F01": item.f01 != "" ? File(item.f01) : "",
          "F01_NAME": item.f01 != "" ? item.f01.split('/').last : "",
          "F011": item.f011 != "" ? File(item.f011) : "",
          "F011_NAME": item.f011 != "" ? item.f011.split('/').last : "",
          //FOTO PREGUNTA 2
          "F02": item.f02 != "" ? File(item.f02) : "",
          "F02_NAME": item.f02 != "" ? item.f02.split('/').last : "",
          "F021": item.f021 != "" ? File(item.f021) : "",
          "F021_NAME": item.f021 != "" ? item.f021.split('/').last : "",
          //FOTO PREGUNTA 3
          "F03": item.f03 != "" ? File(item.f03) : "",
          "F03_NAME": item.f03 != "" ? item.f03.split('/').last : "",
          "F031": item.f031 != "" ? File(item.f031) : "",
          "F031_NAME": item.f031 != "" ? item.f031.split('/').last : "",
          //FOTO PREGUNTA 4
          "F04": item.f04 != "" ? File(item.f04) : "",
          "F04_NAME": item.f04 != "" ? item.f04.split('/').last : "",
          "F041": item.f041 != "" ? File(item.f041) : "",
          "F041_NAME": item.f041 != "" ? item.f041.split('/').last : "",
          //FOTO PREGUNTA 5
          "F05": item.f05 != "" ? File(item.f05) : "",
          "F05_NAME": item.f05 != "" ? item.f05.split('/').last : "",
          "F051": item.f051 != "" ? File(item.f051) : "",
          "F051_NAME": item.f051 != "" ? item.f051.split('/').last : "",
          //FOTO PREGUNTA 6
          "F06": item.f06 != "" ? File(item.f06) : "",
          "F06_NAME": item.f06 != "" ? item.f06.split('/').last : "",
          "F061": item.f061 != "" ? File(item.f061) : "",
          "F061_NAME": item.f061 != "" ? item.f061.split('/').last : "",
          //FOTO PREGUNTA 7
          "F07": item.f07 != "" ? File(item.f07) : "",
          "F07_NAME": item.f07 != "" ? item.f07.split('/').last : "",
          "F071": item.f071 != "" ? File(item.f071) : "",
          "F071_NAME": item.f071 != "" ? item.f071.split('/').last : "",
          //FOTO PREGUNTA 8
          "F08": item.f08 != "" ? File(item.f08) : "",
          "F08_NAME": item.f08 != "" ? item.f08.split('/').last : "",
          "F081": item.f081 != "" ? File(item.f081) : "",
          "F081_NAME": item.f081 != "" ? item.f081.split('/').last : "",
          //FOTO PREGUNTA 9
          "F09": item.f09 != "" ? File(item.f09) : "",
          "F09_NAME": item.f09 != "" ? item.f09.split('/').last : "",
          "F091": item.f091 != "" ? File(item.f091) : "",
          "F091_NAME": item.f091 != "" ? item.f091.split('/').last : "",
        };
        await _provider.uploadFile(file);
        //4.- Eliminar datos de BD local para no procesar nuevamente
      }
    } catch (error) {
      print("save errores: $error");
    }
  }
}
