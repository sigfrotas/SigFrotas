///Coding: UTF-8

///Arquivo: view_manutencao.dart
///Criado em: "16/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Tela que lista todas as manutenções já feitas
///filtrando os dados por usuário caso seja um condutor ou exibindo todos os dados caso seja admin

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
///FutureObserver do pacote lib_observer
///classe de Strings do arquivo consts.dart
///model de requição de veículos e motos em /src/model
///service de requição de veículos e motos em /src/services
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/model/server/model_requisicao_motos.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao/view_manutencao_list_carro.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao/view_manutencao_list_moto.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_motos_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_manutencao_detalhe.dart';

class ViewManutencao extends StatefulWidget {
  const ViewManutencao({
    @required this.isMotomec,
    Key key,
  }) : super(key: key);
  final bool isMotomec;

  @override
  _ViewManutencaoState createState() => _ViewManutencaoState();
}

class _ViewManutencaoState extends State<ViewManutencao> with SingleTickerProviderStateMixin {
  TabController controller;
  int pos;
  List<ModelRequisicao> requisicoes;

  Future<List<ModelRequisicao>> listRequisicaoCarros() async {
    return await Get.find<ServiceRequisicao>().listRequisicoesByStatus(pos);
  }

  Future<List<ModelRequisicaoMoto>> listRequisicaoMotos() async {
    return await Get.find<ServiceRequisicaoMotos>().listRequisicoesByStatus(pos);
  }

  @override
  void initState() {
    pos = 0;
    controller = TabController(
      vsync: this,
      length: 2,
      initialIndex: pos,
    )..addListener(() {
        if (!controller.indexIsChanging) {
          setState(() {});
        }
      });

    super.initState();
  }

  ///Renderiza tela contendo [AppBar]
  ///[TabBar] para automóveis e motocicletas
  ///[DropdownButton] para filtrar manutenções por status
  ///[TabBarView] contendo duas páginas, uma para listar automóveis e uma listar para motocicletas
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.isMotomec ? Strings.veiculosManutencao : Strings.historicoManutencao,
          ),
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(
                child: Text(Strings.automovel),
                icon: const Icon(Icons.directions_car),
              ),
              Tab(
                child: Text(Strings.motocicleta),
                icon: const Icon(Icons.motorcycle),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Material(
              elevation: 2,
              color: Get.theme.appBarTheme.color,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: pos,
                      onChanged: (int p) => setState(() => pos = p),
                      items: <DropdownMenuItem<int>>[
                        for (int i = 0; i < Arrays.statusRequisicao.length; i++)
                          DropdownMenuItem<int>(
                            value: i,
                            child: Text(Arrays.statusRequisicao[i]),
                          )
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: FutureObserver<List<Object>>(
                future: Future.wait([
                  listRequisicaoCarros(),
                  listRequisicaoMotos(),
                ]),
                onError: (_, e) => Text("Error: $e"),
                onSuccess: (_, data) {
                  final reqCarros = data[0] as List<ModelRequisicao>;
                  final reqMotos = data[1] as List<ModelRequisicaoMoto>;
                  return TabBarView(
                    controller: controller,
                    children: <Widget>[
                      ViewManutencaoList(
                        icon: Icon(Icons.directions_car, color: Get.theme.accentColor),
                        requisicoes: reqCarros,
                        onItemTap: (c) {
                          Get.to<void>(
                            ViewManutencaoCarroDetalhe(
                              requisicao: c,
                              editable: widget.isMotomec,
                            ),
                          );
                        },
                      ),
                      ViewManutencaoListMoto(
                        requisicoes: reqMotos,
                        onItemTap: (m) {
                          Get.to<void>(ViewManutencaoMotosDetalhe(
                              requisicao: m, editable: widget.isMotomec));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
