import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/model/server/model_requisicao_motos.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_circunstancia.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_lataria.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_limpeza.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_pneu.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/requisicao_validator.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/composed_text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewRequisicaoMotos extends StatefulWidget {
  const ViewRequisicaoMotos({Key key, this.veiculo_id}) : super(key: key);
  final int veiculo_id;

  @override
  _ViewRequisicaoMotosState createState() => _ViewRequisicaoMotosState();
}

class _ViewRequisicaoMotosState extends State<ViewRequisicaoMotos> {
  ModelRequisicaoMoto model;
  final _gk = GlobalKey<State>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    model = ModelRequisicaoMoto(veiculo_id: widget.veiculo_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.requisicaoMotos),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Enviar",
              style: Get.textTheme.button,
            ),
            onPressed: () async {
              final state = _formKey.currentState;
              if (state.validate()) {
                state.save();
                final s = Get.find<ServiceRequisicaoMotos>();
                try {
                  await AsyncDialog.run(context, _gk, () async => s.postRequesicao(model));
                  Get.back();
                } on DioError catch (e) {
                  print(e.response.data);
                }
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ComposedTextTile(
                label: Strings.kilometragem,
                icon: Icon(Icons.insert_chart),
                onChanged: (s) => model.km = int.tryParse(s),
                hint: "199km",
                initialValue: model.km.toString(),
                maxLength: 15,
                validator: RequisicaoValidate.validateKm,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                inputType: TextInputType.number,
              ),
              ComposedTextTile(
                label: Strings.combustivel,
                icon: Icon(Icons.local_gas_station),
                onChanged: (s) => model.combustivel = int.tryParse(s),
                hint: "30",
                initialValue: model.combustivel.toString(),
                maxLength: 15,
                validator: RequisicaoValidate.validateCombustivel,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                inputType: TextInputType.number,
              ),
              ViewManutencaoMotoCircunstancia(
                circunstancia: model.circunstancia,
                onValueChanged: (s) => setState(() => model.circunstancia = s),
              ),
              ListSectionDecorator(label: "Carenagem:"),
              ViewManutencaoMotoLimpeza(
                limpeza: model.limpeza,
                onValueChanged: (v) => setState(() => model.limpeza = v),
              ),
              ViewManutencaoMotoLataria(
                label: "Lado Direito",
                lataria: model.ladoDireito,
                onValueChanged: (v) => setState(() => model.ladoDireito = v),
              ),
              ViewManutencaoMotoLataria(
                label: "Lado Esquerdo",
                lataria: model.ladoEsquerdo,
                onValueChanged: (v) => setState(() => model.ladoEsquerdo = v),
              ),
              ViewManutencaoMotoLataria(
                label: "Parte Superior",
                lataria: model.superior,
                onValueChanged: (v) => setState(() => model.superior = v),
              ),
              ViewManutencaoMotoLataria(
                label: "Parte Interna",
                lataria: model.interna,
                onValueChanged: (v) => setState(() => model.interna = v),
              ),
              ListSectionDecorator(label: "Pneus"),
              ViewManutencaoMotoPneu(
                label: "Pneu Dianteiro",
                pneu: model.pneusDianteiro,
                onValueChanged: (v) => setState(() => model.pneusDianteiro = v),
              ),
              ViewManutencaoMotoPneu(
                label: "Pneu Trazeiro",
                pneu: model.pneusTrazeiro,
                onValueChanged: (v) => setState(() => model.pneusTrazeiro = v),
              )
            ],
          ),
        ),
      ),
    );
  }
}
