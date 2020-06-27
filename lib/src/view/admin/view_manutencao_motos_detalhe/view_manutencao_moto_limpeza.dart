import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewManutencaoMotoLimpeza extends StatelessWidget {
  const ViewManutencaoMotoLimpeza({
    @required this.limpeza,
    Key key,
  }) : super(key: key);

  final int limpeza;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiOptionControll(
        label: "Limpeza Moto",
        children: Maps.limpezaMoto,
        initValue: limpeza,
        onValueChanged: (_) {},
      ),
    );
  }
}
