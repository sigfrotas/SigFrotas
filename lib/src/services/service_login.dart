
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
