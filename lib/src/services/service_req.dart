import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/requisicao.dart';

part 'service_req.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/carros')
abstract class ServiceReq {
  factory ServiceReq(Dio dio, {String baseUrl}) = _ServiceReq;

  @POST('')
  Future<Requisicao> postReq(@Body() Requisicao requisicao);
}
