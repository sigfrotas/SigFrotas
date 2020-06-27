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
        /*...[
          for (var i = 0; i < Arrays.latariaEstado.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: requisicao.latariaEstado[i] ? Text(Arrays.latariaEstado[i]) : null,
            ),
        ]*/
      ],
    );
  }
}
