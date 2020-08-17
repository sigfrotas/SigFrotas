///Coding: UTF-8

///Arquivo: model_last_insert.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para recuperar dados do último veículo adicionado para manutenção, 
///           contendo métodos para ler e escrever json

///-----------------------------------------------------------------------------------

///Importando convert do SDK padrão e intl do pacote intl

import 'dart:convert';
import 'package:intl/intl.dart';

class ModelLastInsert {
  final int tipo_veiculo;
  final int veiculo_id;
  final int requisicao_id;
  final DateTime created_at;
  final String placa;

  ModelLastInsert({
    this.tipo_veiculo,
    this.veiculo_id,
    this.requisicao_id,
    this.created_at,
    this.placa,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo_veiculo': tipo_veiculo,
      'veiculo_id': veiculo_id,
      'requisicao_id': requisicao_id,
      'created_at': created_at?.millisecondsSinceEpoch,
      'placa': placa,
    };
  }

  factory ModelLastInsert.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ModelLastInsert(
      tipo_veiculo: map['tipo_veiculo'],
      veiculo_id: map['veiculo_id'],
      requisicao_id: map['requisicao_id'],
      created_at: DateFormat("yyyy-MM-dd HH:mm:ss").parse(map['created_at']),         
      placa: map['placa'],
    );
  }

  String toJson() => json.encode(toMap());
}
