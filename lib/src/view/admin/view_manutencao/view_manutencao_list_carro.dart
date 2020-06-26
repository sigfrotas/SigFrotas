import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';

class ViewManutencaoList extends StatelessWidget {
  const ViewManutencaoList({
    @required this.requisicoes,
    @required this.icon,
    @required this.onItemTap,
  });

  final List<ModelRequisicao> requisicoes;
  final Icon icon;
  final Function(ModelRequisicao) onItemTap;

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
            leading: icon,
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
