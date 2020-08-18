///Coding: UTF-8

///Arquivo: view_ultimo_proc.dart
///Criado em: "18/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que exibe última requisição de manutenção de veículo feita pelo usuário

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX, intl do pacote intl,
///future_observer do pacote lib_observer, arquivos de constantes,
///models ModelLastInser e ModelRequisicao na pasta src/model/server
///services ServiceLastInsert, ServiceRequisicao, ServiceRequisicaoMotos da pasta src/services
///AsyncDialog em src/utils/awaitable_action
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lib_observer/future_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_last_insert.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/services/service_last_insert.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_manutencao_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_motos_detalhe.dart';

class ViewUltimaProc extends StatelessWidget {
  final _gk = GlobalKey<State>();

  Future<ModelLastInsert> get lastInsert {
    return Get.find<ServiceLastInsert>().getLastInsert();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: FutureObserver<ModelLastInsert>(
        future: lastInsert,
        onSuccess: (_, ModelLastInsert m) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                Strings.ultimoProc,
                textAlign: TextAlign.start,
                style: Get.textTheme.bodyText1,
              ),
            ),
            const Divider(height: 0, indent: 16, endIndent: 16),
            ListTile(
              leading: Icon(Icons.date_range, color: Get.theme.accentColor),
              title: Text(DateFormat("dd/MM/yyyy").format(m.created_at)),
              subtitle: Text("Horário: " + DateFormat("HH:mm").format(m.created_at)),
            ),
            ListTile(
              leading: Icon(Icons.directions_car, color: Get.theme.accentColor),
              title: Text(m.tipo_veiculo == 0 ? "Automóvel" : "Motocicleta"),
              subtitle: Text("Placa: ${m.placa}"),
            ),
            Container(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Spacer(),
                  FlatButton(
                    child: Text(Strings.verMais),
                    onPressed: () async {
                      await AsyncDialog.run(context, _gk, () async {
                        if (m.tipo_veiculo == 0) {
                          final ModelRequisicao c =
                              await Get.find<ServiceRequisicao>().findById(m.requisicao_id);
                          await Get.to(ViewManutencaoCarroDetalhe(requisicao: c, editable: false));
                        } else if (m.tipo_veiculo == 1) {
                          final reqMoto =
                              await Get.find<ServiceRequisicaoMotos>().findById(m.requisicao_id);
                          await Get.to(
                            ViewManutencaoMotosDetalhe(requisicao: reqMoto, editable: false),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
