import 'package:flutter/material.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

mixin WillPopForm {
  Future<bool> willPop({
    @required BuildContext context,
    @required FormState formState,
    @required bool isCreating,
    @required bool hasChanged,
  }) async {
    if (isCreating) {
      return true;
    } else if (formState.validate()) {
      formState.save();
      if (hasChanged) {
        final r = await Dialogs.showConfirmationDialog(
          context: context,
          title: "Atenção",
          message: "Deseja descartar as alterações?",
          positiveCaption: "Descartar",
        );

        return r ?? true;
      } else {
        return true;
      }
    }

    return false;
  }

  void doSave({
    @required BuildContext context,
    @required FormState formState,
    @required dynamic resultData,
  }) {
    if (formState.validate()) {
      formState.save();
      Navigator.of(context).pop<Object>(resultData);
    }
  }
}
