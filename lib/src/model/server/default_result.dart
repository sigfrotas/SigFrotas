///Coding: UTF-8

///Arquivo: default_result.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para receber resposta padrão no servidor, composto por updated_at, created_at e id
///contendo métodos para gerar e ler dados em json 

///-----------------------------------------------------------------------------------

///Importando foundation do SDK padrão e json_annotation do pacote json_serializable

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_result.g.dart';

@immutable
@JsonSerializable(nullable: true)
class DefaultResult {
  final DateTime updated_at;
  final DateTime created_at;
  final int id;

  const DefaultResult({this.updated_at, this.created_at, this.id});

  factory DefaultResult.fromJson(Map<String, Object> json) => _$DefaultResultFromJson(json);

  Map<String, Object> toJson() => _$DefaultResultToJson(this);
}
