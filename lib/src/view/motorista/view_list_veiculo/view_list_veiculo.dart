import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_veiculos.dart';
import 'package:sigfrotas/src/model/server/requisicao.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/view_requisicao.dart';

class ViewListVeiculo extends StatelessWidget {
  const ViewListVeiculo({Key key, this.tipoVeiculo}) : super(key: key);

  final int tipoVeiculo;

  Future<ModelVeiculos> listCarros() async {
    final service = ServiceVeiculos(Get.find<Dio>());
    return service.listCarros();
  }

  Future<ModelVeiculos> listMotos() async {
    final service = ServiceVeiculos(Get.find<Dio>());
    return service.listMotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tipoVeiculo == 0 ? Strings.selecionarCarro : Strings.selecionarMoto),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              leading: const Icon(null),
              title: Text(Strings.prefixo),
              trailing: Text(Strings.placa),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: FutureObserver<ModelVeiculos>(
                future: tipoVeiculo == 0 ? listCarros() : listMotos(),
                onSuccess: (_, ModelVeiculos list) {
                  print(list.veiculo.length);
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      for (final veiculo in list.veiculo)
                        ListTile(
                          leading: Icon(Icons.directions_car),
                          title: Text(veiculo.prefixo),
                          trailing: Text(veiculo.placa),
                          onTap: () => Get.to<ViewRequisicao>(
                            ViewRequisicao(
                              placa: veiculo.placa,
                              prefixo: veiculo.prefixo,
                            ),
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
