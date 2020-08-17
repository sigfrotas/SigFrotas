///Coding: UTF-8

///Arquivo: service_requisicao_motos.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Service que faz requisições http para criar, listar, cancelar, buscar e finalizar requisições de manutenção de motocicletas

///-----------------------------------------------------------------------------------

///Importando Dio do pacote Dio, Retrofit do pacote retrofit, arquivo de constantes e os models DefaultResult, ModelRequisicaoMoto, UpdateResult

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/model_requisicao_motos.dart';
import 'package:sigfrotas/src/model/server/update_result.dart';

part 'service_requisicao_motos.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/requisicoes_moto')
abstract class ServiceRequisicaoMotos {
  factory ServiceRequisicaoMotos(Dio dio, {String baseUrl}) = _ServiceRequisicaoMotos;

  @POST('')
  Future<DefaultResult> postRequesicao(@Body() ModelRequisicaoMoto requisicao);

  @GET('')
  Future<List<ModelRequisicaoMoto>> listRequisicoes();

  @GET('/{id}')
  Future<ModelRequisicaoMoto> findById(@Path() int id);

  @GET('/filter/{status}')
  Future<List<ModelRequisicaoMoto>> listRequisicoesByStatus(@Path() int status);

  @PUT('/cancel/{id}')
  Future<UpdateResult> cancelRequisicao(@Path() int id);

  @PUT('/finish/{id}')
  Future<UpdateResult> finishRequisicao(@Path() int id);
}
