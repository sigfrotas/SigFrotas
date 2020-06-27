import 'package:flutter/material.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';

class ViewListVeiculos extends StatelessWidget {
  const ViewListVeiculos({
    @required this.veiculos,
    @required this.icon,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final List<ModelVeiculo> veiculos;
  final Icon icon;
  final Function(ModelVeiculo veiculo) onTap;

  Widget _statusVeiculo(bool ativa, bool locada) {
    return Text("${ativa ? 'Ativa' : 'inativa'} | ${locada ? 'Locada' : 'Disponível'}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: veiculos.length,
      separatorBuilder: (_, i) => ListDivider(),
      itemBuilder: (_, i) {
        final veiculo = veiculos[i];
        return ListTile(
          leading: icon,
          title: Text(veiculo.prefixo),
          subtitle: _statusVeiculo(veiculo.ativa, veiculo.locada),
          trailing: Text(veiculo.placa),
          onTap: () => onTap(veiculo),
        );
      },
    );
  }
}
