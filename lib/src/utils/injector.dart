///Coding: UTF-8

///Arquivo: injector.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Classe que injeta referências do Dio e services do Retrofit numa instância do GetX

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX, Dio do pacote Dio
///e services da pasta /src/services

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/services/service_last_insert.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

class Injector {
  ///Injeto token, referência do Dio e os services necessários para comunicação com servidor
  static void inject(String token) {
    final dio = Dio()..options.headers['Authorization'] = "Bearer $token";
    Get.put<Dio>(dio);
    Get.put<ServiceRequisicao>(ServiceRequisicao(dio));
    Get.put<ServiceRequisicaoMotos>(ServiceRequisicaoMotos(dio));
    Get.put<ServiceVeiculos>(ServiceVeiculos(dio));
    Get.put<ServiceLastInsert>(ServiceLastInsert(dio));
  }
}
