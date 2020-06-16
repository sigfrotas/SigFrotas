import 'package:flutter/material.dart';
import 'package:nubank_tutorial/pages/home/widgets/bottom_menu/item_menu_bottom.dart';
import 'package:nubank_tutorial/pages/home/widgets/page_view/teste.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

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
    return (TweenAnimationBuilder<double>(
        tween: _tween,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: !widget.showMenu
                ? 0 + MediaQuery.of(context).padding.bottom
                : 0,
            left: value,
            right: value * -1,
            height: MediaQuery.of(context).size.height * 0.14,
            child: IgnorePointer(
              ignoring: widget.showMenu,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: !widget.showMenu ? 1 : 0,
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.indigo[800],
                        child: ItemMenuBottom(
                          icon: Icons.directions_car,
                          text: 'Automóvel',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TestePage()));
                        },
                      ),
                      InkWell(
                        splashColor: Colors.indigo[800],
                        child: ItemMenuBottom(
                          icon: Icons.motorcycle,
                          text: 'Motocicleta',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TestePage()));
                        },
                      ),
                      InkWell(
                        splashColor: Colors.indigo[800],
                        child: ItemMenuBottom(
                          icon: Icons.local_gas_station,
                          text: 'Combustível',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TestePage()));
                        },
                      ),
                      InkWell(
                        splashColor: Colors.indigo[800],
                        child: ItemMenuBottom(
                          icon: Icons.chrome_reader_mode,
                          text: 'Relatórios',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TestePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
