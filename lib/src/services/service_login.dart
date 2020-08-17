///Coding: UTF-8

///Arquivo: service_login.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Service que faz chamadas http para cadastro e validação de usuários

///-----------------------------------------------------------------------------------

///Importando Dio do pacote Dio, Retrofit do pacote retrofit, arquivo de constantes e model ModelLogin

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_login.dart';

part 'service_login.g.dart';

@RestApi(baseUrl: Consts.baseUrl + "/auth")
abstract class ServiceLogin {

  factory ServiceLogin(Dio dio, {String baseUrl}) = _ServiceLogin;

  @POST('/register')
  Future<ModelLogin> register(@Body() Map<String, Object> data);

  @POST('/login')
  Future<ModelLogin> login(@Body() Map<String, Object> data);
}
