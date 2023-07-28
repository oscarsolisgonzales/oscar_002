import 'dart:convert';

import 'package:appsivalmattel/app/data/models/response/response_distribuidora_model.dart';
import 'package:dio/dio.dart';

class DistribuidoraProvider {
  Future<List<ResponseDistribuidoraModel>> getAllDistribuidoras() async {
    final dio = Dio();
    final response = await dio.get(
      'http://www.sivalaplicativos.com/distribuidorasBajar/10',
    );
    final data = json.decode(response.data);
    return data != null
        ? (data as List)
            .map((json) => ResponseDistribuidoraModel.fromJson(json))
            .toList()
        : [];
  }
}
