///Coding: UTF-8

///Arquivo: update_result.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para recebimento de dados ao atualizar dados e método para ler json

///-----------------------------------------------------------------------------------

///Importando foundation do SDK padrão

import 'package:flutter/foundation.dart';

@immutable
class UpdateResult {
  const UpdateResult({this.modified});

  final int modified;

  factory UpdateResult.fromJson(Map<String, Object> json) {
    return UpdateResult(
      modified: json['modified'],
    );
  }
}
