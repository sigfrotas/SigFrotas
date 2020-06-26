import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';

class DropDownStatusRequisicao extends StatelessWidget {
  const DropDownStatusRequisicao({
    @required this.initPos,
    @required this.onChanged,
    Key key,
  }) : super(key: key);
  final int initPos;
  final void Function(int pos) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DropdownButton<int>(
        value: initPos,
        onChanged: onChanged,
        items: <DropdownMenuItem<int>>[
          for (int i = 0; i < Arrays.statusRequisicao.length; i++)
            DropdownMenuItem<int>(
              value: i,
              child: Text(Arrays.statusRequisicao[i]),
            )
        ],
      ),
    );
  }
}
