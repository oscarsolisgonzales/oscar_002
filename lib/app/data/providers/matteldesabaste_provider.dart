import 'dart:io';

import 'package:appsivalmattel/app/data/models/resquest/request_matteldesabaste_model.dart';
import 'package:dio/dio.dart';

class MatteldesabasteProvider {
  Map<String, dynamic> fromMapFile = {};

  Future<String> save(RequestMatteldesabasteModel request) async {
    final dio = Dio();
    final response = await dio.post(
      'http://www.sivalaplicativos.com/matteldesabastesSubir',
      data: request.toMap(),
    );
    print(response.data);
    return "";
  }

  Future<void> addValueMap({
    required String key,
    required String fileName,
    required dynamic value,
  }) async {
    if (fileName.isNotEmpty) {
      fromMapFile[key] = await MultipartFile.fromFile(
        (value as File).path,
        filename: fileName,
      );
    }
  }

  Future<String> uploadFile(Map<String, dynamic> file) async {
    final dio = Dio();
    fromMapFile.clear();

    //PREGUNTA 1
    await addValueMap(
      key: "F01",
      fileName: file["F01_NAME"],
      value: file["F01"],
    );
    await addValueMap(
      key: "F011",
      fileName: file["F011_NAME"],
      value: file["F011"],
    );

    //PREGUNTA 2
    await addValueMap(
      key: "F02",
      fileName: file["F02_NAME"],
      value: file["F02"],
    );
    await addValueMap(
      key: "F021",
      fileName: file["F021_NAME"],
      value: file["F021"],
    );

    //PREGUNTA 3
    await addValueMap(
      key: "F03",
      fileName: file["F03_NAME"],
      value: file["F03"],
    );
    await addValueMap(
      key: "F031",
      fileName: file["F031_NAME"],
      value: file["F031"],
    );

    //PREGUNTA 4
    await addValueMap(
      key: "F04",
      fileName: file["F04_NAME"],
      value: file["F04"],
    );
    await addValueMap(
      key: "F041",
      fileName: file["F041_NAME"],
      value: file["F041"],
    );

    //PREGUNTA 5
    await addValueMap(
      key: "F05",
      fileName: file["F05_NAME"],
      value: file["F05"],
    );
    await addValueMap(
      key: "F051",
      fileName: file["F051_NAME"],
      value: file["F051"],
    );

    //PREGUNTA 6
    await addValueMap(
      key: "F06",
      fileName: file["F06_NAME"],
      value: file["F06"],
    );
    await addValueMap(
      key: "F061",
      fileName: file["F061_NAME"],
      value: file["F061"],
    );

    //PREGUNTA 7
    await addValueMap(
      key: "F07",
      fileName: file["F07_NAME"],
      value: file["F07"],
    );
    await addValueMap(
      key: "F071",
      fileName: file["F071_NAME"],
      value: file["F071"],
    );

    //PREGUNTA 8
    await addValueMap(
      key: "F08",
      fileName: file["F08_NAME"],
      value: file["F08"],
    );
    await addValueMap(
      key: "F081",
      fileName: file["F081_NAME"],
      value: file["F081"],
    );

    //PREGUNTA 9
    await addValueMap(
      key: "F09",
      fileName: file["F09_NAME"],
      value: file["F09"],
    );
    await addValueMap(
      key: "F091",
      fileName: file["F091_NAME"],
      value: file["F091"],
    );

    //Definir imagen
    FormData formData = FormData.fromMap(fromMapFile);
    final response = await dio.post(
      'http://www.sivalaplicativos.com/matteldesabastesSubirImagen',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
        followRedirects: false,
      ),
    );
    return "";
  }
}
