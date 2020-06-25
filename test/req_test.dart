import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU5MjkzODgxMn0.PS22cxxh8q1L5227yJ5M8lwMfKoRpIFLS413Z2QUz8Q";
  final dio = Dio()..options.headers['Authorization'] = "Bearer $token";
  final service = ServiceRequisicao(dio);

  test('toJson', () {
    final requisicao = ModelRequisicao(
      status: 0,
      km_inicial: "123456",
      km_termino: "123457",
      alteracao_lataria: false,
      nivel_oleo: 0,
      qualidade_oleo: 0,
      vazamento_oleo: false,
      local_vazamento_oleo: "",
      nivel_agua: 0,
      vazamento_agua: false,
      local_vazamento_agua: "",
      luz_acesa: false,
      luz_acesa_descricao: "",
      alteracao_farois_dianteiros: false,
      alteracao_farois_trazeiros: false,
    );

    final r = service.postRequesicao(3, requisicao);

    print(r);
  });
}
