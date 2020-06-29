import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/view_requisicao_carro.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/view_requisicao_moto.dart';
import 'package:sigfrotas/src/view/shared/view_list_veiculo/view_list_veiculos.dart';

class CondutorListVeiculos extends StatefulWidget {
  const CondutorListVeiculos({
    @required this.tipoVeiculo,
    Key key,
  }) : super(key: key);

  final int tipoVeiculo;

  @override
  _CondutorListVeiculosState createState() => _CondutorListVeiculosState();
}

class _CondutorListVeiculosState extends State<CondutorListVeiculos> {
  final _memo = AsyncMemoizer<List<ModelVeiculo>>();

  Future<List<ModelVeiculo>> listCarros() async {
    
    final service = Get.find<ServiceVeiculos>();
    return _memo.runOnce(() async {
      return await service.listCarros();
    });
  }

  Future<List<ModelVeiculo>> listMotos() async {
    final service = Get.find<ServiceVeiculos>();
    return _memo.runOnce(() async => service.listMotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipoVeiculo == 0 ? Strings.selecionarCarro : Strings.selecionarMoto),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureObserver<List<ModelVeiculo>>(
            future: widget.tipoVeiculo == 0 ? listCarros() : listMotos(),
            onError: (_, Error e) => Text("Erro: ${e.toString()}"),
            onSuccess: (_, List<ModelVeiculo> list) {
              return Center(
                child: ViewListVeiculos(
                  icon: Icon(
                    widget.tipoVeiculo == 0 ? Icons.directions_car : Icons.motorcycle,
                    color: Get.theme.accentColor,
                  ),
                  veiculos: list,
                  onTap: (ModelVeiculo v) async {
                    await Get.to<DefaultResult>(
                      widget.tipoVeiculo == 0
                          ? ViewRequisicaoCarro(veiculo_id: v.id)
                          : ViewRequisicaoMotos(veiculo_id: v.id),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
