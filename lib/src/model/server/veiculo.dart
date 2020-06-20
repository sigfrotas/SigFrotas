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
    this.veculo,
    this.prefixo,
    this.municipio,
    this.unidade,
    this.ativa,
    this.locada,
  });

  factory Veiculo.fromJson(Map<String, Object> json) => _$VeiculoFromJson(json);

  final int n;
  final String opm;
  final String placa;
  final String veculo;
  final String prefixo;
  final String municipio;
  final String unidade;
  final bool ativa;
  final int locada;

  Map<String, Object> toJson() => _$VeiculoToJson(this);
}
