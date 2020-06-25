import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/veiculo.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/view_requisicao_carro.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/view_requisicao_moto.dart';
import 'package:sigfrotas/src/view/shared/view_list_veiculo/view_list_veiculos.dart';

class CondutorListVeiculos extends StatefulWidget {
  const CondutorListVeiculos({Key key, this.tipoVeiculo}) : super(key: key);

  final int tipoVeiculo;

  @override
  _CondutorListVeiculosState createState() => _CondutorListVeiculosState();
}

class _CondutorListVeiculosState extends State<CondutorListVeiculos> {
  static final _memo = AsyncMemoizer<List<Veiculo>>();

  Future<List<Veiculo>> listCarros() async {
    final service = ServiceVeiculos(Get.find<Dio>());
    return _memo.runOnce(() async {
      return await service.listCarros();
    });
  }

  Future<List<Veiculo>> listMotos() async {
    final service = ServiceVeiculos(Get.find<Dio>());
    return _memo.runOnce(() async => service.listMotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipoVeiculo == 0 ? Strings.selecionarCarro : Strings.selecionarMoto),
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
              child: FutureObserver<List<Veiculo>>(
                future: widget.tipoVeiculo == 0 ? listCarros() : listMotos(),
                onError: (_, Error e) => Text("Erro: ${e.toString()}"),
                onSuccess: (_, List<Veiculo> list) {
                  return ViewListVeiculos(
                    icon: Icon(Icons.directions_car),
                    veiculos: list,
                    onTap: (Veiculo v) async {
                      final r = await Get.to<DefaultResult>(
                        widget.tipoVeiculo == 0
                            ? ViewRequisicaoCarro(veiculo_id: v.id)
                            : ViewRequisicaoMotos(veiculo_id: v.id),
                      );
                    },
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
