///Coding: UTF-8

///Arquivo: awaitable_action.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Class contendo métodos para facilitar a exibição de dialogs de modo assíncrono

///-----------------------------------------------------------------------------------

///Importando Widgets do SDK padrão e Dialogs da pasta /src/view/shared/dialogs.dart

import 'package:flutter/widgets.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

class AsyncDialog {
  ///Mostra um dialog de espera que não retorna dados, apenas fecha o dialog
  static Future<void> run(
    BuildContext context,
    GlobalKey<State> globalKey,
    Future<void> Function() doAsync, {
    void Function(Exception e) onError,
  }) async {
    // ignore: unawaited_futures
    Dialogs.showAwaitingDialog(context: context, key: globalKey);
    try {
      await doAsync();
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

  ///Mostra um dialog de espera e que retorna dados ao fechar
  static Future<T> provide<T>(
    BuildContext context,
    GlobalKey<State> globalKey,
    Future<T> Function() doAsync, {
    void Function(Exception e) onError,
  }) async {
    T data;
    // ignore: unawaited_futures
    Dialogs.showAwaitingDialog(context: context, key: globalKey);
    try {
      data = await doAsync();
    } catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print(e);
      }
    } finally {
      Navigator.of(globalKey.currentContext, rootNavigator: true).pop();
    }

    return data;
  }
}
