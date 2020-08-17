///Coding: UTF-8

///Arquivo: form_view.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Classe para padronizar rotina de validação de formulários e que exibe dialogs
///que impedem que o usuário perca dados ao sair de uma tela

///-----------------------------------------------------------------------------------

///Importando Widgets do SDK padrão e Dialogs da pasta /src/view/shared/dialogs.dart

import 'package:flutter/widgets.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

mixin WillPopForm {
  ///Verifica estado do Form e mostra mensagem de confirmação
  /// caso o usuário aperte a tecla de voltar tendo dados alterados no formulário
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

  ///Efetua rotina de validar e salvar dados do formState e fecha a tela atual
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
