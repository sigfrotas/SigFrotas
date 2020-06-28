class RequisicaoValidate {
  static String validateKm(String km) {
    if (km.isEmpty) {
      return "Kilometragem não pode ser em branco";
    } else {
      return null;
    }
  }

  static String validateCombustivel(String combustivel) {
    final c = int.tryParse(combustivel);
    if (c == null || c < 0) {
      return "Combustível não indicado";
    } else {
      return null;
    }
  }

  static String validatePrefixo(String prefixo) {
    if (prefixo.isEmpty) {
      return "Prefixo em branco";
    } else if (prefixo.length < 4) {
      return "Prefixo deve ter 4 números";
    } else {
      return null;
    }
  }
}
