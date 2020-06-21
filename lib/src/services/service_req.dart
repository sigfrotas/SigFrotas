import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/state/requisicao_model.dart';

part 'service_req.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/requisicoes')
abstract class ServiceReq {
  factory ServiceReq(Dio dio, {String baseUrl}) = _ServiceReq;

  @POST('')
  Future<DefaultResult> postReq(@Body() ViewRequisicaoModel requisicao);
}
