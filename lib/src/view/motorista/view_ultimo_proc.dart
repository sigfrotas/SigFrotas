import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';

class ViewUltimaProc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text(
              Strings.ultimoProc,
              textAlign: TextAlign.start,
              style: Get.textTheme.bodyText1,
            ),
          ),
          const Divider(height: 0, indent: 16, endIndent: 16),
          ListTile(
            leading: Icon(Icons.date_range, color: Get.theme.accentColor),
            title: Text("01/01/2020"),
            subtitle: Text("Horário: 18:30"),
          ),
          ListTile(
            leading: Icon(Icons.directions_car, color: Get.theme.accentColor),
            title: Text("Motocicleta"),
            subtitle: Text("Placa: 1234-ABC"),
          ),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Spacer(),
                FlatButton(
                  child: Text(Strings.verMais),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
