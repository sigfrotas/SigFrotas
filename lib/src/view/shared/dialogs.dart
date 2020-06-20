import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';

class Dialogs {
  static Future<void> showAwaitingDialog({
    BuildContext context,
    GlobalKey key,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            children: <Widget>[
              Column(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(Strings.consultandoServidor),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static Future<bool> showConfirmationDialog({
    @required BuildContext context,
    String title = Strings.atencao,
    String message = Strings.descartarAlteracoes,
    String negativeCaption = Strings.no,
    String positiveCaption = Strings.yes,
  }) async {
    return await showDialog(
      context: context,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text(
              negativeCaption,
              style: Theme.of(context).textTheme.button.copyWith(color: Colors.black87),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text(positiveCaption),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
