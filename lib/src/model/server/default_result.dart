import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'default_result.g.dart';

@immutable
@JsonSerializable(nullable: true)
class DefaultResult {
  final DateTime updated_at;
  final DateTime created_at;
  final int id;

  const DefaultResult({this.updated_at, this.created_at, this.id});

  factory DefaultResult.fromJson(Map<String, Object> json) => _$DefaultResultFromJson(json);

  Map<String, Object> toJson() => _$DefaultResultToJson(this);
}
