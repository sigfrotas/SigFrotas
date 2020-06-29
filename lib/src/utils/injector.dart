import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/services/service_last_insert.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

class Injector {
  static void inject(String token) {
    final dio = Dio()..options.headers['Authorization'] = "Bearer $token";
    Get.put<Dio>(dio);
    Get.put<ServiceRequisicao>(ServiceRequisicao(dio));
    Get.put<ServiceRequisicaoMotos>(ServiceRequisicaoMotos(dio));
    Get.put<ServiceVeiculos>(ServiceVeiculos(dio));
    Get.put<ServiceLastInsert>(ServiceLastInsert(dio));
  }
}
