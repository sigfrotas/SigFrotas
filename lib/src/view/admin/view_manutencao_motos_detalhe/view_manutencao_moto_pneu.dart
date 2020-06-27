import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewManutencaoMotoPneu extends StatelessWidget {
  const ViewManutencaoMotoPneu({
    @required this.pneu,
    @required this.label,
    Key key,
  }) : super(key: key);

  final int pneu;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiOptionControll(
        label: label,
        children: Maps.pneuEstadoMoto,
        initValue: pneu,
        onValueChanged: (_) {},
      ),
    );
  }
}
