///Coding: UTF-8

///Arquivo: link_button.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Botão transparente, texto sublinhado, com design similar a de um hyperlink web

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key key,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FlatButton(
      splashColor: Colors.white54,
      child: Text(
        label,
        style: theme.textTheme.bodyText1.copyWith(
          color: Get.theme.accentColor,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
