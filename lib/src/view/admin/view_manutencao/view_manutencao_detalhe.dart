import 'package:flutter/material.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';

class ViewManutencaoDetalhe extends StatelessWidget {
  const ViewManutencaoDetalhe({Key key, this.requisicao}) : super(key: key);

  final ModelRequisicao requisicao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appbar")),
      body: Container(child: const Text("Teste")),
    );
  }
}
