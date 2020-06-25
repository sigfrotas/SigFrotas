import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/server/model_counter.dart';
import 'package:sigfrotas/src/model/server/veiculo.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjMsImlhdCI6MTU5MzA1MTQ2M30.hnjzbdDvOgLsZHGMiPk7WKuVB6zaRVPue4sXmfxbu9c";
  final dio = Dio();

  dio.options.headers['Authorization'] = "Bearer $token";

  final service = ServiceVeiculos(dio /*, baseUrl: "http://127.0.0.1:3333/veiculos"*/);

  test('carros', () async {
    final result = await service.listCarros();
    assert(result != null);
    result.forEach((v) => print(v.placa));
  });

  test('motos', () async {
    final result = await service.listMotos();
    assert(result != null);

    result.forEach((v) => print(v.placa));
  });

  test('create carro', () async {
    try {
      final v = Veiculo.forInsert(tipo_veiculo: 0);
      final result = await service.createCarro(v);
      print(result.id);
    } on DioError catch (e) {
      print(e.toString());
    }
  });

  test('create moto', () async {
    try {
      final v = Veiculo.forInsert(tipo_veiculo: 1);
      final result = await service.createMoto(v);
    } on DioError catch (e) {
      print(e.message);
    }
  });

  test('counter', () async {
    try {
      final ModelCounter result = await service.getVeiculosCount();
      assert(result != null);
      print(result);
    } catch (e) {
      print(e);
    }
  });
}
