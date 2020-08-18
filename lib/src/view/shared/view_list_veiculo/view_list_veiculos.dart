///Coding: UTF-8

///Arquivo: view_list_veiculos.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget contendo lista de veículos cadastrados

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:sigfrotas/src/model/server/model_veiculo.dart';
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
