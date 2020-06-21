class RequisicaoValidate {
  static String validateKm(String km) {
    if(km.isEmpty) {
      return "Kilometragem não pode ser em branco";
    } else {
      return null;
    }
  }
}