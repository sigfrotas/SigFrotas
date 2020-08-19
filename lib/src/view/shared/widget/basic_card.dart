///Coding: UTF-8

///Arquivo: basic_card.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget contendo um card padronizado com margem, sombra e cantos arredondados

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(1, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Get.theme.cardColor,
        border: Border.all(
          color: Get.theme.dividerColor,
          width: .6,
        ),
      ),
      child: child,
    );
  }
}
