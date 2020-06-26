import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao_motos.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';

class ViewManutencaoListMoto extends StatelessWidget {
  const ViewManutencaoListMoto({
    @required this.requisicoes,
    @required this.onItemTap,
  });

  final List<ModelRequisicaoMoto> requisicoes;
  final Function(ModelRequisicaoMoto) onItemTap;

  @override
  Widget build(BuildContext context) {
    if (requisicoes.isEmpty) {
      return Center(
        child: const Text("Nenhuma requisição"),
      );
    } else {
      return Container(
        height: double.maxFinite,
        child: ListView.separated(
          itemBuilder: (_, i) => ListTile(
            onTap: () => onItemTap(requisicoes[i]),
            leading: Icon(Icons.motorcycle, color: Get.theme.accentColor),
            title: Text("Placa: " + requisicoes[i].veiculo.placa),
            subtitle: Text(
              Arrays.statusRequisicao[requisicoes[i].status],
              style: TextStyle(color: Arrays.statusRequisicaoColors[requisicoes[i].status]),
            ),
            trailing: Text(DateFormat("dd/MM/yyyy").format(requisicoes[i].created_at)),
          ),
          separatorBuilder: (_, i) => ListDivider(),
          itemCount: requisicoes.length,
        ),
      );
    }
  }
}
