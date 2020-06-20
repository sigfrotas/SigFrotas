import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    @required this.items,
    Key key,
  }) : super(key: key);

  final List<BottomMenuItem> items;

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: _tween,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: Get.mediaQuery.padding.bottom,
          left: value,
          right: value * -1,
          height: MediaQuery.of(context).size.height * 0.14,
          child: IgnorePointer(
            ignoring: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1,
              child: Container(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: widget.items,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
