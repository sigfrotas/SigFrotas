import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';
import 'package:sigfrotas/src/model/server/model_counter.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIsImlhdCI6MTU5MzI4MjU3NX0.0oQEp7TOIVov4kL8fFr2tHLyRGb6Sq7lWBmjUzGgYnY";
  final dio = Dio();

  dio.options.headers['Authorization'] = "Bearer $token";

  final service = ServiceVeiculos(dio /*, baseUrl: "http://127.0.0.1:3333/veiculos"*/);

  test('carros', () async {
    try {
      final result = await service.listCarros();
      assert(result != null);
      result.forEach((v) => print(v.placa));
    } on DioError catch (e) {
      print(e);
    }
  });

  test('motos', () async {
    try {
      final result = await service.listMotos();
      assert(result != null);

      result.forEach((v) => print(v.placa));
    } on DioError catch (e) {
      print(e);
    }
  });

  test('create carro', () async {
    try {
      final v = ModelVeiculo.forInsert(tipo_veiculo: 0);
      final result = await service.createCarro(v);
      print(result.id);
    } on DioError catch (e) {
      print(e.toString());
    }
  });

  test('create moto', () async {
    try {
      final v = ModelVeiculo.forInsert(tipo_veiculo: 1);
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
