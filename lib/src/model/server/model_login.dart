///Coding: UTF-8

///Arquivo: model_login.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para receber dados de login e métodos para ler e escrever json

///-----------------------------------------------------------------------------------

///Importando json_annotation do pacote json_serializable

import 'package:json_annotation/json_annotation.dart';

part 'model_login.g.dart';

@JsonSerializable(nullable: true)
class ModelLogin {
  ModelLogin({
    this.nome,
    this.rgpm,
    this.isAdmin,
    this.token,
  });

  factory ModelLogin.fromJson(Map<String, Object> json) {
    return _$ModelLoginFromJson(json);
  }
  String nome;
  String rgpm;
  bool isAdmin;
  String token;

  Map<String, Object> toJson() => _$ModelLoginToJson(this);
}
