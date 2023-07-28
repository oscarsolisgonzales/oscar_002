import 'dart:convert';

import 'package:appsivalmattel/app/data/models/response/response_usuario_model.dart';
import 'package:dio/dio.dart';

class UsuarioProvider{
  Future <List<ResponseUsuarioModel>> getAllUsuarios() async{
    final dio = Dio();
    final response = await dio.get('http://www.sivalaplicativos.com/usuariosBajar/10',);
    final data = json.decode(response.data);
    return data != null
    ? (data as List).map((json) => ResponseUsuarioModel.fromJson(json)).toList()
    : [];
  }
}