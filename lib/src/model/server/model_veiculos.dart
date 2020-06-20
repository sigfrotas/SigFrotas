import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sigfrotas/src/model/server/veiculo.dart';

part 'model_veiculos.g.dart';

@immutable
@JsonSerializable(nullable: true)
class ModelVeiculos {
  const ModelVeiculos({this.veiculo});

  factory ModelVeiculos.fromJson(Map<String, Object> json) => _$ModelVeiculosFromJson(json);

  final List<Veiculo> veiculo;

  Map<String, Object> toJson() => _$ModelVeiculosToJson(this);
}
