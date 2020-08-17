///Coding: UTF-8

///Arquivo: model_requisicao.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para solicitar dados de requisição de veículos e métodos para ler e escrever dados em json

///-----------------------------------------------------------------------------------

///Importando foundation do SDK padrão, intl do pacote intl e arquivo de constantes

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sigfrotas/consts.dart';

class ModelVeiculo {
  int id;
  int n;
  String opm;
  String placa;
  String veiculo;
  String prefixo;
  String municipio;
  String unidade;
  bool ativa;
  bool locada;
  int tipoVeiculo;
  DateTime createdAt;
  DateTime updatedAt;

  ModelVeiculo({
    this.id,
    this.n,
    this.opm,
    this.placa,
    this.veiculo,
    this.prefixo,
    this.municipio,
    this.unidade,
    this.ativa,
    this.locada,
    this.tipoVeiculo,
    this.createdAt,
    this.updatedAt,
  });

  factory ModelVeiculo.forInsert({@required int tipo_veiculo}) {
    return ModelVeiculo(
      n: 0,
      opm: Arrays.unidades[0],
      placa: "QEV-3403",
      veiculo: "PÁLIO WEEKEND",
      prefixo: "0708",
      municipio: "REDENÇÃO",
      unidade: Arrays.unidades[0],
      ativa: true,
      locada: false,
      tipoVeiculo: tipo_veiculo,
    );
  }

  ModelVeiculo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    n = json['n'];
    opm = json['opm'];
    placa = json['placa'];
    veiculo = json['veiculo'];
    prefixo = json['prefixo'];
    municipio = json['municipio'];
    unidade = json['unidade'];
    ativa = json['ativa'];
    locada = json['locada'];
    tipoVeiculo = json['tipo_veiculo'];
    createdAt = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']);
    updatedAt = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['n'] = this.n;
    data['opm'] = this.opm;
    data['placa'] = this.placa;
    data['veiculo'] = this.veiculo;
    data['prefixo'] = this.prefixo;
    data['municipio'] = this.municipio;
    data['unidade'] = this.unidade;
    data['ativa'] = this.ativa;
    data['locada'] = this.locada;
    data['tipo_veiculo'] = this.tipoVeiculo;
    return data;
  }
}
