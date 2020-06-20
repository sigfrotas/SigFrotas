import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_veiculos.dart';

part 'service_veiculos.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/veiculos')
abstract class ServiceVeiculos {
  factory ServiceVeiculos(Dio dio, {String baseUrl}) = _ServiceVeiculos;

  @GET('/motos')
  Future<ModelVeiculos> listMotos();

  @GET('/carros')
  Future<ModelVeiculos> listCarros();
}
