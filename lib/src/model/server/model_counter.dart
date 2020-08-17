///Coding: UTF-8

///Arquivo: model_counter.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para receber total de automoveis, motocicletas e motoristas cadastrados
///contendo métodos para gerar e ler dados em json 

///-----------------------------------------------------------------------------------

///Importando dart:convert do SDK padrão

import 'dart:convert';

class ModelCounter {
  String total_carros;
  String total_motos;
  String total_usuarios;

  ModelCounter({
    this.total_carros,
    this.total_motos,
    this.total_usuarios,
  });

  Map<String, dynamic> toMap() {
    return {
      'total_carros': total_carros,
      'total_motos': total_motos,
      'total_usuarios': total_usuarios,
    };
  }

  factory ModelCounter.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ModelCounter(
      total_carros: map['total_carros'],
      total_motos: map['total_motos'],
      total_usuarios: map['total_usuarios'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ModelCounter(total_carros: $total_carros, total_motos: $total_motos, total_usuarios: $total_usuarios)';
  }
}
