import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';

class ViewManutencaoMotoCircunstancia extends StatelessWidget {
  const ViewManutencaoMotoCircunstancia({
    @required this.circunstancia,
    @required this.onValueChanged,
    Key key,
  }) : super(key: key);

  final int circunstancia;
  final void Function(int v) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiOptionControll(
        label: "Circunstância",
        children: Maps.circunstancia,
        initValue: circunstancia,
        onValueChanged: onValueChanged,
      ),
    );
  }
}
