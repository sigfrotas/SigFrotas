import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU5Mjk0NDMzM30.VsPTtYnROjSrEqBi2UM7e1d_9IBpu1NH9arAM7iY8vc";
  final dio = Dio();
  dio.options.headers['Authorization'] = "Bearer $token";

  final service = ServiceVeiculos(dio);

  test('carros', () async {
    final result = await service.listCarros();
    assert(result != null);
    result.forEach(print);
  });

  test('motos', () async {
    final result = await service.listMotos();
    assert(result != null);
    result.forEach((v) => print(v.placa));
  });
}
