import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'veiculo.g.dart';

@immutable
@JsonSerializable(nullable: true)
class Veiculo {
  const Veiculo({
    this.n,
    this.opm,
    this.placa,
    this.veiculo,
    this.prefixo,
    this.municipio,
    this.unidade,
    this.ativa,
    this.locada,
  });

  factory Veiculo.fromJson(Map<String, Object> json) => _$VeiculoFromJson(json);

  final String n;
  final String opm;
  final String placa;
  final String veiculo;
  final String prefixo;
  final String municipio;
  final String unidade;
  final String ativa;
  final String locada;

  Map<String, Object> toJson() => _$VeiculoToJson(this);
}
