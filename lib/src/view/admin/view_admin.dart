import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Admin"),
      ),
      body: Container(color: Get.theme.cardColor),
    );
  }
}
