import 'package:json_annotation/json_annotation.dart';

part 'requisicao.g.dart';

///Repassar Classe

@JsonSerializable(nullable: true)
class Requisicao {
  Requisicao({
    this.placa,
    this.alteracao,
    this.luz_interna,
    this.buzina,
    this.lataria,
    this.motor,
    this.arrefecimento,
    this.eletrica,
  });

  factory Requisicao.fromJson(Map<String, Object> json) => _$RequisicaoFromJson(json);

  String placa;
  bool alteracao;
  bool luz_interna;
  bool buzina;
  Lataria lataria;
  Motor motor;
  Arrefecimento arrefecimento;
  Eletrica eletrica;

  Map<String, Object> toJson() => _$RequisicaoToJson(this);
}

@JsonSerializable(nullable: true)
class Arrefecimento {
  int nivel_agua;
  bool vazamento;
  String local_vazamento;

  Arrefecimento({
    this.nivel_agua,
    this.vazamento,
    this.local_vazamento,
  });

  factory Arrefecimento.fromJson(Map<String, Object> json) => _$ArrefecimentoFromJson(json);

  Map<String, Object> toJson() => _$ArrefecimentoToJson(this);
}

@JsonSerializable(nullable: true)
class Eletrica {
  Eletrica({
    this.luz_acesa,
    this.luz_acesa_descricao,
    this.alteracao_farois_dianteiros,
    this.alteracao_farois_trazeiros,
    this.front_dir_minima,
    this.front_dir_media,
    this.front_dir_maxima,
    this.front_dir_pisca,
    this.front_esq_minima,
    this.front_esq_media,
    this.front_esq_maxima,
    this.front_esq_pisca,
    this.traz_dir_minima,
    this.traz_dir_media,
    this.traz_dir_maxima,
    this.traz_dir_pisca,
    this.traz_esq_minima,
    this.traz_esq_media,
    this.traz_esq_maxima,
    this.traz_esq_pisca,
  });

  bool luz_acesa;
  String luz_acesa_descricao;
  bool alteracao_farois_dianteiros;
  bool alteracao_farois_trazeiros;
  bool front_dir_minima;
  bool front_dir_media;
  bool front_dir_maxima;
  bool front_dir_pisca;
  bool front_esq_minima;
  bool front_esq_media;
  bool front_esq_maxima;
  bool front_esq_pisca;
  bool traz_dir_minima;
  bool traz_dir_media;
  bool traz_dir_maxima;
  bool traz_dir_pisca;
  bool traz_esq_minima;
  bool traz_esq_media;
  bool traz_esq_maxima;
  bool traz_esq_pisca;

  factory Eletrica.fromJson(Map<String, Object> json) => _$EletricaFromJson(json);

  Map<String, Object> toJson() => _$EletricaToJson(this);
}

@JsonSerializable(nullable: true)
class Lataria {
  bool arranhao;
  bool trincado;
  bool amassado;
  bool perfurado_projetil;
  bool quebrado;

  Lataria({
    this.arranhao,
    this.trincado,
    this.amassado,
    this.perfurado_projetil,
    this.quebrado,
  });

  factory Lataria.fromJson(Map<String, Object> json) => _$LatariaFromJson(json);

  Map<String, Object> toJson() => _$LatariaToJson(this);
}

@JsonSerializable(nullable: true)
class Motor {
  int nivel_oleo;
  int qualidade_oleo;
  bool vazamento;
  String local_vazamento;

  Motor({
    this.nivel_oleo,
    this.qualidade_oleo,
    this.vazamento,
    this.local_vazamento,
  });

  factory Motor.fromJson(Map<String, Object> json) => _$MotorFromJson(json);

  Map<String, Object> toJson() => _$MotorToJson(this);
}
