///Coding: UTF-8

///Arquivo: consts.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Arquivo contendo constantes disponibilizando todo o texto exibido na aplicação

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão
import 'package:flutter/material.dart';

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

  static const List<String> latariaEstadoMoto = [
    "Ok",
    "Batido",
    "Riscado",
    "Quebrado",
  ];

  static const List<String> pneuEstadoMoto = [
    "Novo",
    "Bom",
    "Medio",
    "Careca",
    "Furado",
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

  static const List<String> statusRequisicao = [
    "${Strings.emAberto}",
    "${Strings.finalizadas}",
    "${Strings.canceladas}",
  ];

  static const List<Color> statusRequisicaoColors = [
    Colors.orange,
    Colors.green,
    Colors.blueGrey,
  ];

  static const List<String> unidades = [
    "7°BPM",
    "39° PEL",
    "40° PEL",
    "59°PPD",
  ];

  static const List<String> opcoesStatusRequisicao = [
    Strings.finalizarRequisicao,
    Strings.cancelarRequisicao,
  ];
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
  static const String veiculosManutencao = "Veículos em manutenção";
  static const String historicoManutencao = "Relação de manutenções";
  static const String emAberto = "Em Aberto";
  static const String finalizadas = "Finalizadas";
  static const String canceladas = "Canceladas";
  static const String kmInicial = "Km Inicial";
  static const String kmTermino = "Km Termino";
  static const String kilometragem = "Kilometragem";

  static const String diantDir = "Dianteiro Direito";
  static const String diantEsq = "Dianteiro Esquerdo";
  static const String trazDir = "Trazeiro Direito";
  static const String trazEsq = "Trazeiro Esquero";

  static const String finalizar = "Finalizar";
  static const String cancelarRequisicao = "Cancelar Manutenção";
  static const String finalizarRequisicao = "Finalizar Manutenção";

  static const String alterarRequisicao = "Status da Manutenção";

  ///Strings usadas em validação de campos
  static const String campoBranco = "Campo está em branco";
  static const String placaInvalida = "Placa inválida";
}

class Maps {
  static final Map<int, Widget> bomMedioRuim = {
    0: Text(Arrays.nivelItems[0]),
    1: Text(Arrays.nivelItems[1]),
    2: Text(Arrays.nivelItems[2]),
  };

  static final Map<int, Widget> limpezaMoto = {
    0: Text("Limpa"),
    1: Text("Suja"),
  };

  static final Map<int, Widget> circunstancia = {
    0: Text("Ordinário"),
    1: Text("Extraordinário"),
  };

  static final Map<int, Widget> estadoLatariaMoto = {
    0: Text(Arrays.latariaEstadoMoto[0]),
    1: Text(Arrays.latariaEstadoMoto[1]),
    2: Text(Arrays.latariaEstadoMoto[2]),
    3: Text(Arrays.latariaEstadoMoto[3]),
  };

  static final Map<int, Widget> pneuEstadoMoto = {
    0: Text(Arrays.pneuEstadoMoto[0]),
    1: Text(Arrays.pneuEstadoMoto[1]),
    2: Text(Arrays.pneuEstadoMoto[2]),
    3: Text(Arrays.pneuEstadoMoto[3]),
    4: Text(Arrays.pneuEstadoMoto[4]),
  };
}
