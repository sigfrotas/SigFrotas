import 'package:flutter/widgets.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

class AsyncDialog {
  static Future<void> execute(
    BuildContext context,
    GlobalKey<State> globalKey, {
    @required Future<void> Function() doAsync,
    @required VoidCallback onSucess,
    void Function(Object error) onError,
  }) async {
    Dialogs.showAwaitingDialog(context: context, key: globalKey);
    try {
      await doAsync();
      onSucess();
    } catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print(e);
      }
    } finally {
      Navigator.of(globalKey.currentContext, rootNavigator: true).pop();
    }
  }
}
