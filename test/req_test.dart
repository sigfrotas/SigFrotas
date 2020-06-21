import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/state/requisicao_model.dart';
import 'package:sigfrotas/src/services/service_req.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU5MjYxODMzMH0.yulDBjAUtVQChMl5YIXEwnZoxDvku21vzghhOSWr9Dc";
  final dio = Dio()..options.headers['Authorization'] = "Bearer $token";
  final service = ServiceReq(dio);

  test('toJson', () {
    final req = ViewRequisicaoModel(
      prefixo: "1478",
      placa: "1212-CCC",
    );

    print(req.toJson());
  });
}
