import 'dart:convert';

class ModelCounter {
  String total_carros;
  String total_motos;
  String total_usuarios;

  ModelCounter({
    this.total_carros,
    this.total_motos,
    this.total_usuarios,
  });

  Map<String, dynamic> toMap() {
    return {
      'total_carros': total_carros,
      'total_motos': total_motos,
      'total_usuarios': total_usuarios,
    };
  }

  static ModelCounter fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ModelCounter(
      total_carros: map['total_carros'],
      total_motos: map['total_motos'],
      total_usuarios: map['total_usuarios'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ModelCounter(total_carros: $total_carros, total_motos: $total_motos, total_usuarios: $total_usuarios)';
  }
}
