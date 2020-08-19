///Coding: UTF-8

///Arquivo: list_section_decorator.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget contendo um separador de listas, contendo título e uma linha horizontal 

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';

class ListSectionDecorator extends StatelessWidget {
  const ListSectionDecorator({
    @required this.label,
    this.padding = const EdgeInsets.all(16),
    this.hasDivider = true,
    Key key,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (hasDivider) ListDivider(),
        Container(
          padding: padding,
          width: double.maxFinite,
          child: Text(
            label,
            style: Get.textTheme.subtitle1.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
