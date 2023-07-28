import 'dart:convert';
import 'package:appsivalmattel/app/data/models/response/response_puntoventa_model.dart';
import 'package:dio/dio.dart';

class PuntoventaProvider {
  Future<List<ResponsePuntoventaModel>> getAllPuntoventas() async {
    final dio = Dio();
    final response = await dio.get(
      'http://www.sivalaplicativos.com/puntoventasBajar/10',
    );
    final data = json.decode(response.data);
    return data != null
        ? (data as List)
            .map((json) => ResponsePuntoventaModel.fromJson(json))
            .toList()
        : [];
  }
}
