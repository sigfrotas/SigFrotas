import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(1, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Get.theme.cardColor,
        border: Border.all(
          color: Get.theme.dividerColor,
          width: .6,
        ),
      ),
      child: child,
    );
  }
}
