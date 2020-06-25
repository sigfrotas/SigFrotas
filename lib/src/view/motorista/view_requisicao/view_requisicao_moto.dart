import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';

class ViewRequisicaoMotos extends StatefulWidget {
  const ViewRequisicaoMotos({Key key, this.veiculo_id}) : super(key: key);
  final int veiculo_id;

  @override
  _ViewRequisicaoMotosState createState() => _ViewRequisicaoMotosState();
}

class _ViewRequisicaoMotosState extends State<ViewRequisicaoMotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.requisicaoMotos),
      ),
      body: Container(
        child: Center(
          child: Text(
            "veículo ${widget.veiculo_id}",
          ),
        ),
      ),
    );
  }
}
