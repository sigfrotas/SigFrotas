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
