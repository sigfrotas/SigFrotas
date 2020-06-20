import 'package:json_annotation/json_annotation.dart';

part 'model_login.g.dart';

@JsonSerializable(nullable: true)
class ModelLogin {
  ModelLogin({
    this.nome,
    this.rgpm,
    this.isAdmin,
    this.token,
  });

  factory ModelLogin.fromJson(Map<String, Object> json) {
    return _$ModelLoginFromJson(json);
  }
  String nome;
  String rgpm;
  bool isAdmin;
  String token;

  Map<String, Object> toJson() => _$ModelLoginToJson(this);
}
