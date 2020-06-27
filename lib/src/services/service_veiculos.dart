import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/model_counter.dart';

part 'service_veiculos.g.dart';

@RestApi(baseUrl: Consts.baseUrl + '/veiculos')
abstract class ServiceVeiculos {
  factory ServiceVeiculos(Dio dio, {String baseUrl}) = _ServiceVeiculos;

  /// /1 = Motos /0 = Locado
  @GET('/1/0')
  Future<List<ModelVeiculo>> listMotos();

  /// / 0 = Carro /0 = Locado
  @GET('/0/0')
  Future<List<ModelVeiculo>> listCarros();

  @POST('/0')
  Future<DefaultResult> createCarro(@Body() ModelVeiculo veiculo);

  @POST('/1')
  Future<DefaultResult> createMoto(@Body() ModelVeiculo veiculo);

  @DELETE('/{id}')
  Future<void> deleteMoto(@Path() int id);

  @GET('/counter')
  Future<ModelCounter> getVeiculosCount();
}
