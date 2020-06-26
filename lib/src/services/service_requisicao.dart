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

  @POST('/{id}')
  Future<DefaultResult> postRequesicao(@Path() int veiculo_id, @Body() ModelRequisicao requisicao);

  @GET('')
  Future<List<ModelRequisicao>> listRequisicoes();

  @GET('/{id}')
  Future<ModelRequisicao> findById();

  @GET('/filter/{status}')
  Future<List<ModelRequisicao>> listRequisicoesByStatus(@Path() int status);

  @PUT('/cancel/{id}')
  Future<UpdateResult> cancelRequisicao(@Path() int id);

  @PUT('/finish/{id}')
  Future<UpdateResult> finishRequisicao(@Path() int id);
}
