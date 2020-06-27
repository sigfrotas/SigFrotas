import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_manutencao_descricao.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewMotorDetalhe extends StatelessWidget {
  const ViewMotorDetalhe({
    @required this.nivelOleo,
    @required this.qualidadeOleo,
    @required this.vazamentoOleo,
    @required this.localVazamento,
    Key key,
  }) : super(key: key);

  final int nivelOleo, qualidadeOleo;
  final bool vazamentoOleo;
  final String localVazamento;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListSectionDecorator(label: "Motor"),
        MultiOptionControll(
          label: "Nível óleo",
          children: Maps.bomMedioRuim,
          initValue: nivelOleo,
          onValueChanged: (_) {},
        ),
        MultiOptionControll(
          label: "Qualidade óleo",
          children: Maps.bomMedioRuim,
          initValue: qualidadeOleo,
          onValueChanged: (_) {},
        ),
        ViewManutencaoDescricao(
          hasDescricao: vazamentoOleo,
          descricao: localVazamento,
        )
      ],
    );
  }
}