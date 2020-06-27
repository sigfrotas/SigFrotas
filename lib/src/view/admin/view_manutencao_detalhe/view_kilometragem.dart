import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_kilometro_item.dart';

class ViewKilometragem extends StatelessWidget {
  const ViewKilometragem({
    @required this.kmInicial,
    @required this.kmTermino,
    Key key,
  }) : super(key: key);

  final String kmInicial, kmTermino;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          ViewKilometroItem(
            label: Strings.kmInicial,
            km: kmInicial,
            iconColor: Colors.teal,
          ),
          ViewKilometroItem(
            label: Strings.kmTermino,
            km: kmTermino,
            iconColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
