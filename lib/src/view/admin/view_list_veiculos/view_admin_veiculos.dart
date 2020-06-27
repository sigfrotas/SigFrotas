import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/veiculo.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';
import 'package:sigfrotas/src/view/admin/view_create_carro/view_create_carro.dart';
import 'package:sigfrotas/src/view/shared/view_list_veiculo/view_list_veiculos.dart';

class ViewAdminVeiculos extends StatefulWidget {
  const ViewAdminVeiculos({Key key}) : super(key: key);

  @override
  _ViewAdminVeiculosState createState() => _ViewAdminVeiculosState();
}

class _ViewAdminVeiculosState extends State<ViewAdminVeiculos> with SingleTickerProviderStateMixin {
  ServiceVeiculos get _service => Get.find<ServiceVeiculos>();

  final _memo = AsyncMemoizer<List<Object>>();

  Future<List<Object>> listData() async {
    return _memo.runOnce(
      () => Future.wait([_service.listCarros(), _service.listMotos()]),
    );
  }

  TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  void callViewCreateVeiculo(int tipo) async {
    final r = await Get.to<Veiculo>(ViewCreateVeiculo(tipo_veiculo: tipo));

    ///TODO - Verificar se deve tratar o retorno
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.veiculos),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Text(Strings.automovel),
              icon: const Icon(Icons.directions_car),
            ),
            Tab(
              child: Text(Strings.motocicleta),
              icon: const Icon(Icons.motorcycle),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () => callViewCreateVeiculo(controller.index),
        label: const Text(Strings.novo),
      ),
      body: FutureObserver(
        future: listData(),
        onError: (_, e) => Text("Erro: ${e.toString()}"),
        onSuccess: (_, data) {
          final carros = data[0] as List<Veiculo>;
          final motos = data[1] as List<Veiculo>;
          return Container(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                ViewListVeiculos(
                  veiculos: carros,
                  icon: const Icon(Icons.directions_car),
                  onTap: (v) => Get.snackbar(
                    "Não implementado",
                    "Implementar tela de requisicao",
                    snackPosition: SnackPosition.BOTTOM,
                  ),
                ),
                ViewListVeiculos(
                  veiculos: motos,
                  icon: const Icon(Icons.motorcycle),
                  onTap: (_) => Get.snackbar(
                    "Não implementado",
                    "Implementar tela de requisicao",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
