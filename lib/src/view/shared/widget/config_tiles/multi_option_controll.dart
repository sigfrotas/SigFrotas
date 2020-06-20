import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class MultiOptionControll extends StatefulWidget {
  const MultiOptionControll({
    @required this.initValue,
    @required this.onValueChanged,
    @required this.label,
    @required this.children,
    Key key,
  }) : super(key: key);

  final int initValue;
  final void Function(int newVal) onValueChanged;
  final String label;
  final Map<int, Widget> children;

  @override
  _MultiOptionControllState createState() => _MultiOptionControllState();
}

class _MultiOptionControllState extends State<MultiOptionControll> {
  int _value;

  @override
  void initState() {
    _value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            widget.label,
            textAlign: TextAlign.start,
            style: Get.textTheme.subtitle1,
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(bottom: 16),
          child: CupertinoSegmentedControl<int>(
            groupValue: _value,
            onValueChanged: widget.onValueChanged,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
