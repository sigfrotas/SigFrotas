import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/utils/form_view.dart';
import 'package:sigfrotas/src/view/motorista/view_requisicao/requisicao_validator.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/composed_text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/multi_option_controll.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/toggleable_title.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewRequisicaoCarro extends StatefulWidget {
  const ViewRequisicaoCarro({
    @required this.veiculo_id,
    Key key,
  }) : super(key: key);

  final int veiculo_id;

  @override
  _ViewRequisicaoCarroState createState() => _ViewRequisicaoCarroState();
}

class _ViewRequisicaoCarroState extends State<ViewRequisicaoCarro> with WillPopForm {
  ModelRequisicao model;
  final _formKey = GlobalKey<FormState>();
  final _gk = GlobalKey<State>();

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
    model = ModelRequisicao(veiculo_id: widget.veiculo_id);
    super.initState();
  }

  Widget _farolCaption(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(label, style: Get.textTheme.caption.copyWith(color: Get.theme.accentColor)),
    );
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
                  final service = Get.find<ServiceRequisicao>();

                  try {
                    await AsyncDialog.run(context, _gk, () async => service.postRequesicao(model));
                    Get.back();
                  } on DioError catch (e) {
                    print(e);
                  }
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
                  initialValue: model.km_inicial,
                  validator: RequisicaoValidate.validateKm,
                  onChanged: (String km) {
                    model.km_inicial = km;
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
                  initialValue: model.km_termino,
                  validator: RequisicaoValidate.validateKm,
                  onChanged: (String km) => model.km_termino = km,
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
                  value: model.alteracao_lataria,
                  onChanged: (b) => setState(() => model.alteracao_lataria = b),
                ),
                if (model.alteracao_lataria)
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
                  initValue: model.nivel_oleo,
                  onValueChanged: (int i) => setState(() => model.nivel_oleo = i),
                ),
                MultiOptionControll(
                  label: "Qualidade óleo",
                  children: bomMedioRuim,
                  initValue: model.qualidade_oleo,
                  onValueChanged: (int i) => setState(() => model.qualidade_oleo = i),
                ),
                SwitchListTile(
                  title: Text("Há Vazamento de óleo"),
                  value: model.vazamento_oleo,
                  onChanged: (b) => setState(() => model.vazamento_oleo = b),
                ),
                if (model.vazamento_oleo)
                  ComposedTextTile(
                    icon: Icon(Icons.edit),
                    label: "Local de vazamento",
                    validator: (s) {},
                    initialValue: model.local_vazamento_oleo,
                    hint: "Porta malas",
                    maxLength: 128,
                    onChanged: (String s) => setState(() => model.local_vazamento_oleo = s),
                  ),
                ListSectionDecorator(label: "Arrefecimento"),
                MultiOptionControll(
                  label: "Nível de água",
                  children: bomMedioRuim,
                  initValue: model.nivel_agua,
                  onValueChanged: (int i) => setState(() => model.nivel_agua = i),
                ),
                SwitchListTile(
                  title: Text("Há Vazamento de água"),
                  value: model.vazamento_agua,
                  onChanged: (b) => setState(() => model.vazamento_agua = b),
                ),
                if (model.vazamento_agua)
                  ComposedTextTile(
                    label: "Local Vazamento Água",
                    hint: "local de vazametno",
                    onChanged: (s) => setState(() => model.local_vazamento_agua = s),
                    initialValue: model.local_vazamento_agua,
                    maxLength: 128,
                    validator: (s) {},
                    icon: Icon(Icons.edit, color: Colors.red),
                  ),
                ListSectionDecorator(label: "Painel de controle"),
                SwitchListTile(
                  title: Text('Luz acesa durante condução'),
                  value: model.luz_acesa,
                  onChanged: (b) => setState(() => model.luz_acesa = b),
                ),
                if (model.luz_acesa)
                  ComposedTextTile(
                    label: "Local luz acesa",
                    hint: "luz de ...",
                    onChanged: (s) => setState(() => model.luz_acesa_descricao = s),
                    initialValue: model.luz_acesa_descricao,
                    validator: (s) {},
                    maxLength: 128,
                    icon: Icon(Icons.edit, color: Colors.red),
                  ),
                SwitchListTile(
                  title: Text('Alterações farois dianteiros'),
                  value: model.alteracao_farois_dianteiros,
                  onChanged: (b) => setState(() => model.alteracao_farois_dianteiros = b),
                ),
                if (model.alteracao_farois_dianteiros)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _farolCaption("Esquerdo"),
                      ToggleableTile(
                        labels: Arrays.farolEstado,
                        isSelected: model.diantEsq,
                        onPressed: (int pos) => setState(
                          () => model.diantEsq[pos] = !model.diantEsq[pos],
                        ),
                      ),
                      _farolCaption("Direito"),
                      ToggleableTile(
                        isSelected: model.diantDir,
                        labels: Arrays.farolEstado,
                        onPressed: (int pos) => setState(
                          () => model.diantDir[pos] = !model.diantDir[pos],
                        ),
                      ),
                    ],
                  ),
                SwitchListTile(
                  title: Text('Alterações farois trazeiros'),
                  value: model.alteracao_farois_trazeiros,
                  onChanged: (b) => setState(() => model.alteracao_farois_trazeiros = b),
                ),
                if (model.alteracao_farois_trazeiros)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _farolCaption("Esquerdo"),
                      ToggleableTile(
                        labels: Arrays.farolEstado,
                        isSelected: model.trazEsq,
                        onPressed: (int pos) => setState(
                          () => model.trazEsq[pos] = !model.trazEsq[pos],
                        ),
                      ),
                      _farolCaption("Direito"),
                      ToggleableTile(
                        isSelected: model.trazDir,
                        labels: Arrays.farolEstado,
                        onPressed: (int pos) => setState(
                          () => model.trazDir[pos] = !model.trazDir[pos],
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
