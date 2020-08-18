///Coding: UTF-8

///Arquivo: view_counter.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que exibe total de automóveis, veículos e usuários cadastrados no sistema

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX,
///AsyncMemoizer do pacote async, FutureObserver do pacote lib_observer,
///arquivo de constantes
///model ModelCounter em model_counter.dart
///service ServiceVeiculos em service_veiculos.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';
import 'package:lib_observer/future_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_counter.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';

class ViewCounter extends StatefulWidget {
  @override
  _ViewCounterState createState() => _ViewCounterState();
}

class _ViewCounterState extends State<ViewCounter> {
  static final _memo = AsyncMemoizer<ModelCounter>();

  Future<ModelCounter> fetchCounter() async {
    final service = Get.find<ServiceVeiculos>();
    return _memo.runOnce(() async => await service.getVeiculosCount());
  }

  @override
  Widget build(BuildContext context) {
    return FutureObserver<ModelCounter>(
      future: fetchCounter(),
      onError: (_, e) => Text("Erro: ${e.toString()}"),
      onSuccess: (_, counter) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            width: double.maxFinite,
            child: Text(
              Strings.relatorioRapido,
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(height: 0, indent: 16, endIndent: 16),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(Strings.automovel),
            subtitle: Text("${Strings.registrados}:  ${counter.total_carros}"),
          ),
          ListTile(
            leading: Icon(Icons.motorcycle),
            title: Text(Strings.motocicleta),
            subtitle: Text("${Strings.registrados}:  ${counter.total_motos}"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(Strings.condutores),
            subtitle: Text("${Strings.registrados}:  ${counter.total_usuarios}"),
          ),
        ],
      ),
    );
  }
}
