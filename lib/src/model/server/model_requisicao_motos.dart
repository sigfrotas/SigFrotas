///Coding: UTF-8

///Arquivo: model_requisicao.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Model para solicitar dados de requisição de motocicletas e métodos para ler e escrever dados em json

///-----------------------------------------------------------------------------------

///Importando foundation do SDK padrão, intl do pacote intl e model ModelVeículo

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';

class ModelRequisicaoMoto {
  int id;
  int userId;
  int status;
  int veiculo_id;
  int km;
  int limpeza;
  int circunstancia;
  int ladoDireito;
  int ladoEsquerdo;
  int dianteira;
  int trazeira;
  int superior;
  int interna;
  int pneusDianteiro;
  int pneusTrazeiro;
  int combustivel;
  DateTime created_at;
  DateTime updated_at;
  ModelVeiculo veiculo;

  ModelRequisicaoMoto({
    @required this.veiculo_id,
    this.id,
    this.userId,
    this.status = 0,
    this.km = 30,
    this.limpeza = 0,
    this.circunstancia = 0,
    this.ladoDireito = 0,
    this.ladoEsquerdo = 0,
    this.dianteira = 0,
    this.trazeira = 0,
    this.superior = 0,
    this.interna = 0,
    this.pneusDianteiro = 1,
    this.pneusTrazeiro = 1,
    this.combustivel = 10,
    this.created_at,
    this.updated_at,
  });

  ModelRequisicaoMoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    veiculo_id = json['veiculo_id'];
    km = int.parse(json['km']);
    limpeza = json['limpeza'];
    circunstancia = json['circunstancia'];
    ladoDireito = json['lado_direito'];
    ladoEsquerdo = json['lado_esquerdo'];
    dianteira = json['dianteira'];
    trazeira = json['trazeira'];
    superior = json['superior'];
    interna = json['interna'];
    pneusDianteiro = json['pneus_dianteiro'];
    pneusTrazeiro = json['pneus_trazeiro'];
    combustivel = json['combustivel'];
    veiculo = ModelVeiculo.fromJson(json['veiculo']);
    created_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']);
    updated_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['veiculo_id'] = this.veiculo_id;
    data['status'] = this.status;
    data['km'] = this.km;
    data['limpeza'] = this.limpeza;
    data['circunstancia'] = this.circunstancia;
    data['lado_direito'] = this.ladoDireito;
    data['lado_esquerdo'] = this.ladoEsquerdo;
    data['dianteira'] = this.dianteira;
    data['trazeira'] = this.trazeira;
    data['superior'] = this.superior;
    data['interna'] = this.interna;
    data['pneus_dianteiro'] = this.pneusDianteiro;
    data['pneus_trazeiro'] = this.pneusTrazeiro;
    data['combustivel'] = this.combustivel;
    return data;
  }
}
