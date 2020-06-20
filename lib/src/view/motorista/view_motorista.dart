import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMotorista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Motorista"),
      ),
      body: Container(color: Get.theme.cardColor),
    );
  }
}
