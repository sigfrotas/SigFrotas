import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyAppBar({Key key, this.showMenu, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.indigo[900],
            height: MediaQuery.of(context).size.height * .20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //primeira row é a Imagem
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                //segunda row é o texto
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Icon(!showMenu ? Icons.menu : Icons.menu),
                Icon(!showMenu ? Icons.expand_more : Icons.expand_less),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
