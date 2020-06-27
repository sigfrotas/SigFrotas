import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/toggleable_title.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewEletricaDetalhe extends StatelessWidget {
  const ViewEletricaDetalhe({
    @required this.luzAcesa,
    @required this.luzAcesaDescricao,
    @required this.diantEsq,
    @required this.diantDir,
    @required this.trazEsq,
    @required this.trazDir,
    Key key,
  }) : super(key: key);

  final bool luzAcesa;
  final String luzAcesaDescricao;
  final List<bool> diantEsq, diantDir, trazEsq, trazDir;

  @override
  Widget build(BuildContext context) {
    if (luzAcesa == true || [...diantEsq, ...diantDir, ...trazEsq, ...trazDir].every((f) => f)) {
      return Column(
        children: <Widget>[
          ListSectionDecorator(label: "Painel de controle"),
          if (luzAcesa)
            Column(
              children: <Widget>[
                Text("Local luz acesa"),
                Text(luzAcesaDescricao),
              ],
            ),
          _ViewFarol(label: Strings.diantEsq, values: diantEsq),
          _ViewFarol(label: Strings.diantDir, values: diantDir),
          _ViewFarol(label: Strings.trazEsq, values: trazEsq),
          _ViewFarol(label: Strings.trazDir, values: trazEsq),
        ],
      );
    } else {
      return Container();
    }
  }
}

class _ViewFarol extends StatelessWidget {
  final String label;
  final List<bool> values;

  const _ViewFarol({Key key, this.label, this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return values.every((bool f) => f)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  label,
                  style: Get.textTheme.subtitle2,
                ),
              ),
              ToggleableTile(
                labels: Arrays.farolEstado,
                isSelected: values,
                onPressed: (_) {},
              ),
            ],
          )
        : Container();
  }
}
