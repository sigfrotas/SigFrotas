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
}
