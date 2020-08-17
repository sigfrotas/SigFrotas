///Coding: UTF-8

///Arquivo: vault_data.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para gravar dados de acesso do usuário

///-----------------------------------------------------------------------------------

///Importando foundation do SDK padrão

import 'package:flutter/foundation.dart';

@immutable
class VaultData {
  const VaultData({
    this.token,
    this.nome,
    this.rgpm,
    this.isAdmin,
  });
  final String token, nome, rgpm;
  final bool isAdmin;
}
