import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

  static Future<String> showPrefixPickerDialog({
    @required BuildContext context,
    @required String initValue,
    @required String label,
    @required String title,
    @required int maxLength,
    String confirmButton = Strings.salvar,
    String cancelButton = Strings.cancelar,
  }) async {
    final _formKey = GlobalKey<FormState>();

    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(title),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        content: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TextFormField(
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(maxLength),
              ],
              decoration: InputDecoration(
                hintText: "9999",
                labelText: label,
              ),
              keyboardType: TextInputType.number,
              initialValue: initValue,
              onSaved: (s) {
                initValue = s;
              },
              validator: (s) {
                if (int.tryParse(s) == null) {
                  return "Número inválido";
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              cancelButton,
              style: Theme.of(context).textTheme.button.copyWith(color: Colors.black87),
            ),
            onPressed: Get.back,
          ),
          FlatButton(
            child: const Text(Strings.salvar),
            onPressed: () {
              final state = _formKey.currentState;
              if (state.validate()) {
                state.save();
                Get.back(result: initValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
