///Coding: UTF-8

///Arquivo: service_last_insert.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Service que faz chamada http retornando dados do último veículo em manutenção

///-----------------------------------------------------------------------------------

///Importando Dio do pacote Dio, Retrofit do pacote retrofit, arquivo de constantes e model ModelLastInsert

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_last_insert.dart';

part 'service_last_insert.g.dart';

@RestApi(baseUrl: Consts.baseUrl + "/last_request")
abstract class ServiceLastInsert {
  factory ServiceLastInsert(Dio dio, {String baseUrl}) = _ServiceLastInsert;
  
  @GET('')
  Future<ModelLastInsert> getLastInsert();
}
