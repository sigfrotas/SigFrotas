import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_requisicao.g.dart';

@JsonSerializable(nullable: true)
class ModelRequisicao {
  ModelRequisicao({
    @required this.status,
    @required this.km_inicial,
    @required this.km_termino,
    @required this.alteracao_lataria,
    @required this.lataria_arranhado,
    @required this.lataria_amassado,
    @required this.lataria_trincado,
    @required this.lataria_perfurado,
    @required this.lataria_quebrado,
    @required this.nivel_oleo,
    @required this.qualidade_oleo,
    @required this.vazamento_oleo,
    @required this.local_vazamento_oleo,
    @required this.nivel_agua,
    @required this.vazamento_agua,
    @required this.local_vazamento_agua,
    @required this.luz_acesa,
    @required this.luz_acesa_descricao,
    @required this.alteracao_farois_dianteiros,
    @required this.alteracao_farois_trazeiros,
    @required this.dianteiro_direito_minima,
    @required this.dianteiro_direito_media,
    @required this.dianteiro_direito_maxima,
    @required this.dianteiro_direito_pisca,
    @required this.dianteiro_esquerdo_minima,
    @required this.dianteiro_esquerdo_media,
    @required this.dianteiro_esquerdo_maxima,
    @required this.dianteiro_esquerdo_pisca,
    @required this.trazeiro_direito_minima,
    @required this.trazeiro_direito_media,
    @required this.trazeiro_direito_maxima,
    @required this.trazeiro_direito_pisca,
    @required this.trazeiro_esquerdo_minima,
    @required this.trazeiro_esquerdo_media,
    @required this.trazeiro_esquerdo_maxima,
    @required this.trazeiro_esquerdo_pisca,
  });

  factory ModelRequisicao.fromJson(Map<String, Object> json) {
    return _$ModelRequisicaoFromJson(json);
  }

  final int status;
  final String km_inicial;
  final String km_termino;
  final bool alteracao_lataria;
  final bool lataria_arranhado;
  final bool lataria_amassado;
  final bool lataria_trincado;
  final bool lataria_perfurado;
  final bool lataria_quebrado;
  final int nivel_oleo;
  final int qualidade_oleo;
  final int vazamento_oleo;
  final String local_vazamento_oleo;
  final int nivel_agua;
  final bool vazamento_agua;
  final String local_vazamento_agua;
  final bool luz_acesa;
  final String luz_acesa_descricao;
  final bool alteracao_farois_dianteiros;
  final bool alteracao_farois_trazeiros;
  final bool dianteiro_direito_minima;
  final bool dianteiro_direito_media;
  final bool dianteiro_direito_maxima;
  final bool dianteiro_direito_pisca;
  final bool dianteiro_esquerdo_minima;
  final bool dianteiro_esquerdo_media;
  final bool dianteiro_esquerdo_maxima;
  final bool dianteiro_esquerdo_pisca;
  final bool trazeiro_direito_minima;
  final bool trazeiro_direito_media;
  final bool trazeiro_direito_maxima;
  final bool trazeiro_direito_pisca;
  final bool trazeiro_esquerdo_minima;
  final bool trazeiro_esquerdo_media;
  final bool trazeiro_esquerdo_maxima;
  final bool trazeiro_esquerdo_pisca;

  Map<String, Object> toJson() => _$ModelRequisicaoToJson(this);
}
