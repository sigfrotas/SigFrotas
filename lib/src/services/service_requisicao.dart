import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';

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
}
