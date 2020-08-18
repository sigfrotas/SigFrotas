///Coding: UTF-8

///Arquivo: view_manutencao_arrefecimento.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que exibe opções sobre o estado do arrefecimento do veículo

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, arquivo de constantes,
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewManutencaoArrefecimento extends StatelessWidget {
  const ViewManutencaoArrefecimento({
    Key key,
    this.nivelAgua,
    this.vazamentoAgua,
    this.localVazamento,
  }) : super(key: key);

  final int nivelAgua;
  final bool vazamentoAgua;
  final String localVazamento;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListSectionDecorator(label: "Arrefecimento"),
        MultiOptionControll(
          label: "Nível de água",
          children: Maps.bomMedioRuim,
          initValue: nivelAgua,
          onValueChanged: (_){},
        ),
        if (vazamentoAgua)
          Container(
            child: Column(
              children: <Widget>[
                Text("Local Vazamento Água"),
                Text(localVazamento),
              ],
            ),
          ),
      ],
    );
  }
}
