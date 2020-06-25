class Consts {
  static const String baseUrl = "https://vtrserver.herokuapp.com";
  static const String registerUrl = "/auth/register";
  static const String loginUrl = "/auth/login";
  static const String motomec = "MOTOMEC";
}

class Arrays {
  static const List<String> latariaEstado = [
    "Arranhado",
    "Amassado",
    "Trincado",
    "Perfurado",
    "Quebrado",
  ];

  static const List<String> nivelItems = [
    "Bom",
    "Medio",
    "Ruim",
  ];

  static const List<String> farolEstado = [
    "Mínima",
    "Média",
    "Máxima",
    "Pisca",
  ];

  static const List<String> unidades = ["7°BPM", "39° PEL", "40° PEL", "59°PPD"];
}

class Strings {
  static const String appName = "SigFrotas";
  static const String consultandoServidor = "Consultando Servidor... Aguarde";
  static const String atencao = "Atenção";
  static const String descartarAlteracoes = "Deseja descartar as alterações feitas?";
  static const String yes = "Sim";
  static const String no = "Não";
  static const String novo = "Novo";
  static const String email = "email";
  static const String token = "token";
  static const String pass = "pass";
  static const String isAdmin = "isAdmin";
  static const String rgpm = "RGPM";
  static const String rgMilitar = "RG Militar";
  static const String senha = "Senha";
  static const String senhaConfirmar = "Confirmar senha";
  static const String automovel = "Automóvel";
  static const String veiculos = "Veículos";
  static const String motocicleta = "Motocicleta";
  static const String combustivel = "Combustível";
  static const String relatorios = "Relatórios";
  static const String manutencao = "Manutenção";
  static const String ultimoProc = "Último Procedimento Efetuado: ";
  static const String verMais = "Ver >";
  static const String selecioneVeiculo = "Selecionar Veículo";
  static const String selecionarCarro = "Selecionar Automóvel";
  static const String selecionarMoto = "Selecionar Motocicleta";
  static const String relatorioRapido = "Relatório Rápido";
  static const String condutores = "Condutores";
  static const String requisicaoMotos = "Requisição de Motos";
  static const String registrados = "Registrados";
  static const String novoAutomovel = "Novo automóvel";
  static const String novoMoto = "Nova motocicleta";
  static const String prefixo = "Prefixo veículo";
  static const String placa = "Placa";
  static const String opm = "OPM";
  static const String descVeiculo = "Modelo";
  static const String municipio = "Município";
  static const String unidade = "Unidade";
  static const String ativa = "Ativa";
  static const String locada = "Locada";
  static const String hintCarro = "Modelo e marca";
  static const String local = "Local do Veículo";
  static const String salvar = "Salvar";
  static const String cancelar = "Cancelar";

  ///Strings usadas em validação de campos
  static const String campoBranco = "Campo está em branco";
  static const String placaInvalida = "Placa inválida";
}
