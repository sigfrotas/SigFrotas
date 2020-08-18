///Coding: UTF-8

///Arquivo: view_kilometro_item.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que exibe kilometragem

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewKilometroItem extends StatelessWidget {
  const ViewKilometroItem({
    @required this.km,
    @required this.label,
    @required this.iconColor,
    Key key,
  }) : super(key: key);

  final String km;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.info,
            color: iconColor,
          ),
          const SizedBox(width: 16),
          Column(
            children: <Widget>[
              Text(label, style: Get.textTheme.bodyText1.copyWith(color: Get.theme.accentColor)),
              const SizedBox(height: 8),
              Text("$km Km", style: Get.textTheme.caption),
            ],
          ),
        ],
      ),
    );
  }
}
