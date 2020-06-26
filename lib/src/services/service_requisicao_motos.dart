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

  @POST('/{id}')
  Future<DefaultResult> postRequesicao(
      @Path() int veiculo_id, @Body() ModelRequisicaoMoto requisicao);

  @GET('')
  Future<List<ModelRequisicaoMoto>> listRequisicoes();

  @GET('/{id}')
  Future<ModelRequisicaoMoto> findById();

  @GET('/filter/{status}')
  Future<List<ModelRequisicaoMoto>> listRequisicoesByStatus(@Path() int status);

  @PUT('/cancel/{id}')
  Future<UpdateResult> cancelRequisicao(@Path() int id);

  @PUT('/finish/{id}')
  Future<UpdateResult> finishRequisicao(@Path() int id);
}
