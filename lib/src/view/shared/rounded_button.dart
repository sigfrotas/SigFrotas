///Coding: UTF-8

///Arquivo: rounded_button.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Botão com cantos arrendondados, colorido e com texto

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
///Widgets da pasta /src/view

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    @required this.label,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.extend = true,
    this.color,
    Key key,
  }) : super(key: key);

  final bool extend;
  final Color color;
  final String label;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: MaterialButton(
        colorBrightness: Brightness.dark,
        minWidth: extend ? double.maxFinite : double.maxFinite,
        color: theme.primaryColor,
        child: Text(label),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
