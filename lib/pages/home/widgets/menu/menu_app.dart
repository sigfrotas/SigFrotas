import 'package:flutter/material.dart';
import 'package:sigfrotas/pages/home/widgets/menu/item_menu.dart';
import 'package:sigfrotas/pages/splash/splash_page.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key key, this.top, this.showMenu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: showMenu ? 1 : 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/policeman.png',
                  height: 120,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Renato Ferreira Carr',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Post/Grad: ',
                    children: [
                      TextSpan(text: '3º SGT PM', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: 'CPF: ',
                    children: [
                      TextSpan(
                          text: '042.281.432-00', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: 'CNH: ',
                    children: [
                      TextSpan(text: '78753670689', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      ItemMenu(
                        icon: Icons.person_outline,
                        text: 'Perfil',
                      ),
                      ItemMenu(
                        icon: Icons.info_outline,
                        text: 'Me ajuda',
                      ),
                      ItemMenu(
                        icon: Icons.settings,
                        text: 'Configurações',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.7, color: Colors.white54)),
                        child: RaisedButton(
                          color: Colors.red[900],
                          highlightColor: Colors.transparent,
                          elevation: 0,
                          disabledElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          splashColor: Colors.red[600],
                          child: Text(
                            'SAIR DO APP',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => SplashScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
