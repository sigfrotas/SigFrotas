import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';

class ModelRequisicao {
  ModelRequisicao({
    @required this.veiculo_id,
    this.id,
    this.status = 0,
    this.km_inicial = "123",
    this.km_termino = "456",
    this.alteracao_lataria = false,
    this.nivel_oleo = 0,
    this.qualidade_oleo = 0,
    this.vazamento_oleo = false,
    this.local_vazamento_oleo = "",
    this.nivel_agua = 0,
    this.vazamento_agua = false,
    this.local_vazamento_agua = "",
    this.luz_acesa = false,
    this.luz_acesa_descricao = "",
    this.alteracao_farois_dianteiros = false,
    this.alteracao_farois_trazeiros = false,
  }) {
    diantEsq = [false, false, false, false];
    diantDir = [false, false, false, false];
    trazEsq = [false, false, false, false];
    trazDir = [false, false, false, false];
    latariaEstado = [false, false, false, false, false];
  }

  factory ModelRequisicao.fromJson(Map<String, dynamic> json) {
    final model = ModelRequisicao(
      id: json['id'] as int,
      veiculo_id: json['veiculo_id'] as int,
      status: json['status'] as int,
      km_inicial: json['km_inicial'] as String,
      km_termino: json['km_termino'] as String,
      alteracao_lataria: json['alteracao_lataria'] as bool,
      nivel_oleo: json['nivel_oleo'] as int,
      qualidade_oleo: json['qualidade_oleo'] as int,
      vazamento_oleo: json['vazamento_oleo'] as bool,
      local_vazamento_oleo: json['local_vazamento_oleo'] as String,
      nivel_agua: json['nivel_agua'] as int,
      vazamento_agua: json['vazamento_agua'] as bool,
      local_vazamento_agua: json['local_vazamento_agua'] as String,
      luz_acesa: json['luz_acesa'] as bool,
      luz_acesa_descricao: json['luz_acesa_descricao'] as String,
      alteracao_farois_dianteiros: json['alteracao_farois_dianteiros'] as bool,
      alteracao_farois_trazeiros: json['alteracao_farois_trazeiros'] as bool,
    );

    model.latariaEstado = [
      json['lataria_arranhado'] as bool,
      json['lataria_amassado'] as bool,
      json['lataria_trincado'] as bool,
      json['lataria_perfurado'] as bool,
      json['lataria_quebrado'] as bool,
    ];

    model.diantDir = [
      json['dianteiro_direito_minima'] as bool,
      json['dianteiro_direito_media'] as bool,
      json['dianteiro_direito_maxima'] as bool,
      json['dianteiro_direito_pisca'] as bool,
    ];

    model.diantEsq = [
      json['dianteiro_esquerdo_minima'] as bool,
      json['dianteiro_esquerdo_media'] as bool,
      json['dianteiro_esquerdo_maxima'] as bool,
      json['dianteiro_esquerdo_pisca'] as bool,
    ];

    model.trazDir = [
      json['trazeiro_direito_minima'] as bool,
      json['trazeiro_direito_media'] as bool,
      json['trazeiro_direito_maxima'] as bool,
      json['trazeiro_direito_pisca'] as bool,
    ];

    model.trazEsq = [
      json['trazeiro_esquerdo_minima'] as bool,
      json['trazeiro_esquerdo_media'] as bool,
      json['trazeiro_esquerdo_maxima'] as bool,
      json['trazeiro_esquerdo_pisca'] as bool,
    ];

    model.veiculo = ModelVeiculo.fromJson(json['veiculo']);
    model.created_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']);
    model.updated_at = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']);

    return model;
  }

  int id;
  int veiculo_id;
  int status;
  String km_inicial;
  String km_termino;
  bool alteracao_lataria;
  int nivel_oleo;
  int qualidade_oleo;
  bool vazamento_oleo;
  String local_vazamento_oleo;
  int nivel_agua;
  bool vazamento_agua;
  String local_vazamento_agua;
  bool luz_acesa;
  String luz_acesa_descricao;
  bool alteracao_farois_dianteiros;
  bool alteracao_farois_trazeiros;
  List<bool> diantEsq, diantDir, trazEsq, trazDir, latariaEstado;
  ModelVeiculo veiculo;
  DateTime created_at, updated_at;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'veiculo_id': this.veiculo_id,
      'status': this.status,
      'km_inicial': this.km_inicial,
      'km_termino': this.km_termino,
      'alteracao_lataria': this.alteracao_lataria,
      'lataria_arranhado': this.latariaEstado[0],
      'lataria_amassado': this.latariaEstado[1],
      'lataria_trincado': this.latariaEstado[2],
      'lataria_perfurado': this.latariaEstado[3],
      'lataria_quebrado': this.latariaEstado[4],
      'nivel_oleo': this.nivel_oleo,
      'qualidade_oleo': this.qualidade_oleo,
      'vazamento_oleo': this.vazamento_oleo,
      'local_vazamento_oleo': this.local_vazamento_oleo,
      'nivel_agua': this.nivel_agua,
      'vazamento_agua': this.vazamento_agua,
      'local_vazamento_agua': this.local_vazamento_agua,
      'luz_acesa': this.luz_acesa,
      'luz_acesa_descricao': this.luz_acesa_descricao,
      'alteracao_farois_dianteiros': this.alteracao_farois_dianteiros,
      'alteracao_farois_trazeiros': this.alteracao_farois_trazeiros,
      'dianteiro_direito_minima': this.diantDir[0],
      'dianteiro_direito_media': this.diantDir[1],
      'dianteiro_direito_maxima': this.diantDir[2],
      'dianteiro_direito_pisca': this.diantDir[3],
      'dianteiro_esquerdo_minima': this.diantEsq[0],
      'dianteiro_esquerdo_media': this.diantEsq[1],
      'dianteiro_esquerdo_maxima': this.diantEsq[2],
      'dianteiro_esquerdo_pisca': this.diantEsq[3],
      'trazeiro_direito_minima': this.trazDir[0],
      'trazeiro_direito_media': this.trazDir[1],
      'trazeiro_direito_maxima': this.trazDir[2],
      'trazeiro_direito_pisca': this.trazDir[3],
      'trazeiro_esquerdo_minima': this.trazEsq[0],
      'trazeiro_esquerdo_media': this.trazEsq[1],
      'trazeiro_esquerdo_maxima': this.trazEsq[2],
      'trazeiro_esquerdo_pisca': this.trazEsq[3],
    };
  }
}
