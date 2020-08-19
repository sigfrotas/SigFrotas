///Coding: UTF-8

///Arquivo: list_divider.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Separado de listas, com identação padrão

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão

import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 16,
      endIndent: 16,
    );
  }
}
