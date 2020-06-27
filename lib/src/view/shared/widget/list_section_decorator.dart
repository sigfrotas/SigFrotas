import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';

class ListSectionDecorator extends StatelessWidget {
  const ListSectionDecorator({
    @required this.label,
    this.padding = const EdgeInsets.all(16),
    this.hasDivider = true,
    Key key,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (hasDivider) ListDivider(),
        Container(
          padding: padding,
          width: double.maxFinite,
          child: Text(
            label,
            style: Get.textTheme.subtitle1.copyWith(color: Get.theme.accentColor),
          ),
        ),
      ],
    );
  }
}
