import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewManutencaoDescricao extends StatelessWidget {
  const ViewManutencaoDescricao({Key key, this.hasDescricao, this.descricao}) : super(key: key);

  final bool hasDescricao;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    if (hasDescricao) {
      return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Local de vazamento",
              style: Get.textTheme.subtitle1.copyWith(color: Get.theme.accentColor),
            ),
            Divider(),
            Container(
              width: double.maxFinite,
              color: Get.theme.primaryColor,
              padding: const EdgeInsets.all(16),
              child: Text(
                descricao,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
