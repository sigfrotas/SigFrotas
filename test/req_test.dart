import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sigfrotas/src/model/server/requisicao.dart';
import 'package:sigfrotas/src/services/service_req.dart';

void main() {
  const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU5MjYxODMzMH0.yulDBjAUtVQChMl5YIXEwnZoxDvku21vzghhOSWr9Dc";
  final dio = Dio()..options.headers['Authorization'] = "Bearer $token";
  final service = ServiceReq(dio);

  test('post req', () async {
    final req = Requisicao(
      placa: "####-CCA",
      alteracao: false,
      luz_interna: true,
      buzina: true,
      lataria: Lataria(
        arranhao: true,
        trincado: true,
        amassado: true,
        perfurado_projetil: true,
        quebrado: true,
      ),
      motor: Motor(
        nivel_oleo: 0,
        qualidade_oleo: 0,
        vazamento: false,
        local_vazamento: "local descrição",
      ),
      arrefecimento: Arrefecimento(
        nivel_agua: 0,
        vazamento: true,
        local_vazamento: "local vazamento_descricao",
      ),
      eletrica: Eletrica(
        luz_acesa: true,
        luz_acesa_descricao: "descrição luz acesa",
        alteracao_farois_dianteiros: false,
        alteracao_farois_trazeiros: false,
        front_dir_minima: false,
        front_dir_media: false,
        front_dir_maxima: false,
        front_dir_pisca: false,
        front_esq_minima: false,
        front_esq_media: false,
        front_esq_maxima: false,
        front_esq_pisca: false,
        traz_dir_minima: false,
        traz_dir_media: false,
        traz_dir_maxima: false,
        traz_dir_pisca: false,
        traz_esq_minima: false,
        traz_esq_media: false,
        traz_esq_maxima: false,
        traz_esq_pisca: false,
      ),
    );

    print(req.toJson());

    // final r = await service.postReq(req);

    // assert(r != null);

    // print(r.placa);
    // print(r.luz_interna);
    // print(r.buzina);
  });
}
