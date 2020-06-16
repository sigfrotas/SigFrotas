import 'package:flutter/material.dart';

class TestePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Teste'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        )
      ),
    );
    
  }
}