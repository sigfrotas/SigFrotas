import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';

class ViewManutencaoMotoPneu extends StatelessWidget {
  const ViewManutencaoMotoPneu({
    @required this.pneu,
    @required this.label,
    @required this.onValueChanged,
    Key key,
  }) : super(key: key);

  final int pneu;
  final String label;
  final void Function(int v) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiOptionControll(
        label: label,
        children: Maps.pneuEstadoMoto,
        initValue: pneu,
        onValueChanged: onValueChanged,
      ),
    );
  }
}
