import 'package:flutter/foundation.dart';

class ViewRequisicaoModel {
  ViewRequisicaoModel({
    @required this.placa,
    @required this.prefixo,
    this.kmInicial = "",
    this.kmTermino = "",
    this.alteracaoLataria = false,
    this.latariaEstado,
    this.nivelOleo = 0,
    this.qualidadeOleo = 0,
    this.vazamentoOleo = false,
    this.localVazamentoOleo = "",
    this.nivelAgua = 0,
    this.vazamentoAgua = false,
    this.localVazamentoAgua = "",
    this.luzAcesa = false,
    this.luzAcesaDescricao = "",
    this.alteracaoFaroisDianteiros = false,
    this.alteracaoFaroisTrazeiros = false,
    this.frontalDireito,
    this.frontalEsquerdo,
    this.trazeiroDireito,
    this.trazeiroEsquerdo,
  }) {
    latariaEstado = <bool>[true, false, false, false, false];
    frontalDireito = <bool>[true, false, false, false];
    frontalEsquerdo = <bool>[true, false, false, false];
    trazeiroDireito = <bool>[true, false, false, false];
    trazeiroEsquerdo = <bool>[true, false, false, false];
  }

  ///Dados ficha requisicao;
  String kmInicial, kmTermino, placa, prefixo;

  ///Dados da Lataria
  bool alteracaoLataria;
  List<bool> latariaEstado;

  ///Dados do motor;
  int nivelOleo;
  int qualidadeOleo;
  bool vazamentoOleo;
  String localVazamentoOleo;

  ///Dados arrefecimento
  int nivelAgua;
  bool vazamentoAgua;
  String localVazamentoAgua;

  ///Eletrica
  bool luzAcesa;
  String luzAcesaDescricao;
  bool alteracaoFaroisDianteiros;
  bool alteracaoFaroisTrazeiros;
  List<bool> frontalDireito;
  List<bool> frontalEsquerdo;
  List<bool> trazeiroDireito;
  List<bool> trazeiroEsquerdo;

  Map<String, Object> toJson() {
    return {
      "placa": this.placa,
      "prefixo": this.prefixo,
      "km_inicial": this.kmInicial,
      "km_termino": this.kmTermino,
      "alteracao_lataria": this.alteracaoLataria,
      "lataria_arranhado": this.latariaEstado[0],
      "lataria_amassado": this.latariaEstado[1],
      "lataria_trincado": this.latariaEstado[2],
      "lataria_perfurado": this.latariaEstado[3],
      "lataria_quebrado": this.latariaEstado[4],
      "nivel_oleo": this.nivelOleo,
      "qualidade_oleo": this.qualidadeOleo,
      "vazamento_oleo": this.vazamentoOleo,
      "local_vazamento_oleo": this.localVazamentoOleo,
      "nivel_agua": this.nivelAgua,
      "vazamento_agua": this.vazamentoAgua,
      "local_vazamento_agua": this.localVazamentoAgua,
      "luz_acesa": this.luzAcesa,
      "luz_acesa_descricao": this.luzAcesaDescricao,
      "alteracao_farois_dianteiros": this.alteracaoFaroisDianteiros,
      "alteracao_farois_trazeiros": this.alteracaoFaroisTrazeiros,
      "dianteiro_direito_minima": this.frontalDireito[0],
      "dianteiro_direito_media": this.frontalDireito[1],
      "dianteiro_direito_maxima": this.frontalDireito[2],
      "dianteiro_direito_pisca": this.frontalDireito[3],
      "dianteiro_esquerdo_minima": this.frontalDireito[0],
      "dianteiro_esquerdo_media": this.frontalDireito[1],
      "dianteiro_esquerdo_maxima": this.frontalDireito[2],
      "dianteiro_esquerdo_pisca": this.frontalDireito[3],
      "trazeiro_direito_minima": this.frontalDireito[0],
      "trazeiro_direito_media": this.frontalDireito[1],
      "trazeiro_direito_maxima": this.frontalDireito[2],
      "trazeiro_direito_pisca": this.frontalDireito[3],
      "trazeiro_esquerdo_minima": this.frontalDireito[0],
      "trazeiro_esquerdo_media": this.frontalDireito[1],
      "trazeiro_esquerdo_maxima": this.frontalDireito[2],
      "trazeiro_esquerdo_pisca": this.frontalDireito[3],
    };
  }
}
