///Coding: UTF-8

///Arquivo: service_requisicao.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Service que faz requisições http para criar, listar, cancelar, buscar e finalizar requisições de manutenção de automoveis

///-----------------------------------------------------------------------------------

///Importando Dio do pacote Dio, Retrofit do pacote retrofit, arquivo de constantes e os models DefaultResult, ModelRequisicao, UpdateResult

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/model/server/update_result.dart';

part 'service_requisicao.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/requisicoes')
abstract class ServiceRequisicao {
  factory ServiceRequisicao(Dio dio, {String baseUrl}) = _ServiceRequisicao;

  @POST('')
  Future<DefaultResult> postRequesicao(@Body() ModelRequisicao requisicao);

  @GET('')
  Future<List<ModelRequisicao>> listRequisicoes();

  @GET('/{id}')
  Future<ModelRequisicao> findById(@Path() int id);

  @GET('/filter/{status}')
  Future<List<ModelRequisicao>> listRequisicoesByStatus(@Path() int status);

  @PUT('/cancel/{id}')
  Future<UpdateResult> cancelRequisicao(@Path() int id);

  @PUT('/finish/{id}')
  Future<UpdateResult> finishRequisicao(@Path() int id);
}
