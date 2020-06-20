import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    @required this.icon,
    @required this.label,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Get.theme.accentColor,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              Text(
                label,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        width: Get.width * 0.22,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white24),
      ),
      onTap: onTap,
    );
  }
}
