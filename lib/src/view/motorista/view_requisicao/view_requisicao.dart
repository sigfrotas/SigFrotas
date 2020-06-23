import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/state/requisicao_model.dart';
import 'package:sigfrotas/src/utils/form_view.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/requisicao_validator.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/composed_text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/toggleable_title.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewRequisicao extends StatefulWidget {
  const ViewRequisicao({
    @required this.placa,
    @required this.prefixo,
    Key key,
  }) : super(key: key);

  final String placa, prefixo;

  @override
  _ViewRequisicaoState createState() => _ViewRequisicaoState();
}

class _ViewRequisicaoState extends State<ViewRequisicao> with WillPopForm {
  ///Gerar ServiceRequisicao
  ///Enviar dados

  ViewRequisicaoModel model;
  final _formKey = GlobalKey<FormState>();

  final Map<int, Widget> bomMedioRuim = {
    0: Text(Arrays.nivelItems[0]),
    1: Text(Arrays.nivelItems[1]),
    2: Text(Arrays.nivelItems[2]),
  };

  final Map<int, Widget> faroisEstado = {
    0: Text(Arrays.farolEstado[0]),
    1: Text(Arrays.farolEstado[1]),
    2: Text(Arrays.farolEstado[2]),
    3: Text(Arrays.farolEstado[3]),
  };

  @override
  void initState() {
    model = ViewRequisicaoModel(
      placa: widget.placa,
      prefixo: widget.prefixo,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return willPop(
          context: context,
          formState: _formKey.currentState,
          isCreating: true,
          hasChanged: true,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Requisição"),
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

                  ///TODO - Chamar server aqui
                  /* final dio = Get.find<Dio>();
                  final service = ServiceRequisicao(dio);

                  try {
                    final r = await service.postRequesicao(model);
                    if (r is DefaultResult) {
                      Get.back(result: r);
                    }
                  } catch (ex) {
                    print(ex);
                  } */
                }
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextTile(
                  icon: Icon(Icons.timeline, color: Colors.teal),
                  label: "KM Inicial",
                  hint: "100 km",
                  initialValue: model.kmInicial,
                  validator: RequisicaoValidate.validateKm,
                  onChanged: (String km) {
                    model.kmInicial = km;
                  },
                  inputType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  trailingWidth: 100,
                ),
                TextTile(
                  icon: Icon(Icons.timeline, color: Colors.red),
                  label: "KM Final",
                  hint: "100 km",
                  initialValue: model.kmTermino,
                  validator: RequisicaoValidate.validateKm,
                  onChanged: (String km) => model.kmTermino = km,
                  inputType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  trailingWidth: 100,
                ),
                ListSectionDecorator(
                  label: "Lataria",
                ),
                SwitchListTile(
                  title: Text("Alteração na lataria"),
                  value: model.alteracaoLataria,
                  onChanged: (b) => setState(() => model.alteracaoLataria = b),
                ),
                if (model.alteracaoLataria)
                  Column(
                    children: <Widget>[
                      for (var i = 0; i < Arrays.latariaEstado.length; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CheckboxListTile(
                            title: Text(Arrays.latariaEstado[i]),
                            value: model.latariaEstado[i],
                            onChanged: (b) => setState(() => model.latariaEstado[i] = b),
                          ),
                        ),
                    ],
                  ),
                ListSectionDecorator(label: "Motor"),
                MultiOptionControll(
                  label: "Nível óleo",
                  children: bomMedioRuim,
                  initValue: model.nivelOleo,
                  onValueChanged: (int i) => setState(() => model.nivelOleo = i),
                ),
                MultiOptionControll(
                  label: "Qualidade óleo",
                  children: bomMedioRuim,
                  initValue: model.qualidadeOleo,
                  onValueChanged: (int i) => setState(() => model.qualidadeOleo = i),
                ),
                SwitchListTile(
                  title: Text("Há Vazamento de óleo"),
                  value: model.vazamentoOleo,
                  onChanged: (b) => setState(() => model.vazamentoOleo = b),
                ),
                if (model.vazamentoOleo)
                  ComposedTextTile(
                    icon: Icon(Icons.edit),
                    label: "Local de vazamento",
                    validator: (s) {},
                    initialValue: model.localVazamentoOleo,
                    hint: "Porta malas",
                    onChanged: (String s) => setState(() => model.localVazamentoOleo = s),
                  ),
                ListSectionDecorator(label: "Arrefecimento"),
                MultiOptionControll(
                  label: "Nível de água",
                  children: bomMedioRuim,
                  initValue: model.nivelAgua,
                  onValueChanged: (int i) => setState(() => model.nivelAgua = i),
                ),
                SwitchListTile(
                  title: Text("Há Vazamento de água"),
                  value: model.vazamentoAgua,
                  onChanged: (b) => setState(() => model.vazamentoAgua = b),
                ),
                if (model.vazamentoAgua)
                  ComposedTextTile(
                    label: "Local Vazamento Água",
                    hint: "local de vazametno",
                    onChanged: (s) => setState(() => model.localVazamentoAgua = s),
                    initialValue: model.localVazamentoAgua,
                    validator: (s) {},
                    icon: Icon(Icons.edit, color: Colors.red),
                  ),
                ListSectionDecorator(label: "Painel de controle"),
                SwitchListTile(
                  title: Text('Luz acesa durante condução'),
                  value: model.luzAcesa,
                  onChanged: (b) => setState(() => model.luzAcesa = b),
                ),
                if (model.luzAcesa)
                  ComposedTextTile(
                    label: "Local luz acesa",
                    hint: "luz de ...",
                    onChanged: (s) => setState(() => model.luzAcesaDescricao = s),
                    initialValue: model.localVazamentoAgua,
                    validator: (s) {},
                    icon: Icon(Icons.edit, color: Colors.red),
                  ),
                SwitchListTile(
                  title: Text('Alterações farois dianteiros'),
                  value: model.alteracaoFaroisDianteiros,
                  onChanged: (b) => setState(() => model.alteracaoFaroisDianteiros = b),
                ),
                if (model.alteracaoFaroisDianteiros)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ToggleableTile(
                        labels: Arrays.farolEstado,
                        isSelected: model.frontalEsquerdo,
                        onPressed: (int pos) => setState(
                          () => model.frontalEsquerdo[pos] = !model.frontalEsquerdo[pos],
                        ),
                      ),
                      ToggleableTile(
                        isSelected: model.frontalDireito,
                        labels: Arrays.farolEstado,
                        onPressed: (int pos) => setState(
                          () => model.frontalDireito[pos] = !model.frontalDireito[pos],
                        ),
                      ),
                    ],
                  ),
                SwitchListTile(
                  title: Text('Alterações farois trazeiros'),
                  value: model.alteracaoFaroisTrazeiros,
                  onChanged: (b) => setState(() => model.alteracaoFaroisTrazeiros = b),
                ),
                if (model.alteracaoFaroisTrazeiros)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ToggleableTile(
                        labels: Arrays.farolEstado,
                        isSelected: model.trazeiroEsquerdo,
                        onPressed: (int pos) => setState(
                          () => model.trazeiroEsquerdo[pos] = !model.trazeiroEsquerdo[pos],
                        ),
                      ),
                      ToggleableTile(
                        isSelected: model.trazeiroDireito,
                        labels: Arrays.farolEstado,
                        onPressed: (int pos) => setState(
                          () => model.trazeiroDireito[pos] = !model.trazeiroDireito[pos],
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
