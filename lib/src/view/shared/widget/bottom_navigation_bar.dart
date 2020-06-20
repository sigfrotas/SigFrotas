import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key, this.items}) : super(key: key);
  final List<BottomMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: Get.height * 0.12,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }
}
