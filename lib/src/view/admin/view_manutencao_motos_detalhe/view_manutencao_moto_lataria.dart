import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewManutencaoMotoLataria extends StatelessWidget {
  const ViewManutencaoMotoLataria({
    @required this.lataria,
    @required this.label,
    Key key,
  }) : super(key: key);

  final int lataria;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiOptionControll(
        label: label,
        children: Maps.estadoLatariaMoto,
        initValue: lataria,
        onValueChanged: (_) {},
      ),
    );
  }
}
