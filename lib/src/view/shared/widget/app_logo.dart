import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fitWidth,
        height: Get.height * 0.2,
      ),
    );
  }
}
