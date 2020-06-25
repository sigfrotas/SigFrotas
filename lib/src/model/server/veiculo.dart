import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sigfrotas/consts.dart';

part 'veiculo.g.dart';

@JsonSerializable(nullable: true)
class Veiculo {
  Veiculo({
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
    this.tipo_veiculo,
  });

  factory Veiculo.fromJson(Map<String, Object> json) => _$VeiculoFromJson(json);

  factory Veiculo.forInsert({@required int tipo_veiculo}) {
    return Veiculo(
      n: 0,
      opm: Arrays.unidades[0],
      placa: "QEV-3403",
      veiculo: "PÁLIO WEEKEND",
      prefixo: "0708",
      municipio: "REDENÇÃO",
      unidade: Arrays.unidades[0],
      ativa: true,
      locada: false,
      tipo_veiculo: tipo_veiculo,
    );
  }

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
  int tipo_veiculo;

  Map<String, Object> toJson() => _$VeiculoToJson(this);
}
