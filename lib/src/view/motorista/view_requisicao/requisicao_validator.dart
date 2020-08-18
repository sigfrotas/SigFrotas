///Coding: UTF-8

///Arquivo: requisicao_validator.dart
///Criado em: "18/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Classse auxiliar para validação de requisição de manutenção

///-----------------------------------------------------------------------------------

class RequisicaoValidate {
  ///Valida kilometragem
  static String validateKm(String km) {
    if (km.isEmpty) {
      return "Kilometragem não pode ser em branco";
    } else {
      return null;
    }
  }

  ///Valida litros de combustível
  static String validateCombustivel(String combustivel) {
    final c = int.tryParse(combustivel);
    if (c == null || c < 0) {
      return "Combustível não indicado";
    } else {
      return null;
    }
  }

  ///Valida prefixo do veículo
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
