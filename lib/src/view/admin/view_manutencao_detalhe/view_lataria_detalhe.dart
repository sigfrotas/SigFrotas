///Coding: UTF-8

///Arquivo: view_lataria_detalhe.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que exibe opçṍes sobre o estado da lataria do veículo

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX, arquivo de constantes,
///ModelRequisicao em model_requisicao.dart
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewLatariaDetalhe extends StatelessWidget {
  const ViewLatariaDetalhe({Key key, this.requisicao}) : super(key: key);

  final ModelRequisicao requisicao;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListSectionDecorator(label: "Lataria"),
        Wrap(
          direction: Axis.horizontal,
          spacing: 16,
          children: <Widget>[
            for (var i = 0; i < Arrays.latariaEstado.length; i++)
              requisicao.latariaEstado[i]
                  ? Chip(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      visualDensity: VisualDensity.comfortable,
                      backgroundColor: Get.theme.primaryColor,
                      label: Text(
                        Arrays.latariaEstado[i],
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : null,
          ],
        ),
      ],
    );
  }
}
