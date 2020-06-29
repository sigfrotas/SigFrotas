import 'package:flutter/material.dart';

class ViewCondutorRelacao extends StatefulWidget {
  @override
  _ViewCondutorRelacaoState createState() => _ViewCondutorRelacaoState();
}

class _ViewCondutorRelacaoState extends State<ViewCondutorRelacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Relação de Manutenção")),
      body: Container(
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
