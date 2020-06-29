import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/ModelVeiculo.dart';
import 'package:sigfrotas/src/services/service_veiculos.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/utils/form_view.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/composed_text_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/drop_down_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/config_tiles/switch_tile.dart';
import 'package:sigfrotas/src/view/shared/widget/list_divider.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';
import 'package:validation_extensions/validation_extensions.dart';

class ViewCreateVeiculo extends StatefulWidget {
  const ViewCreateVeiculo({
    this.tipo_veiculo,
    Key key,
  }) : super(key: key);

  final int tipo_veiculo;

  @override
  _ViewCreateVeiculoState createState() => _ViewCreateVeiculoState();
}

class _ViewCreateVeiculoState extends State<ViewCreateVeiculo> with WillPopForm {
  ModelVeiculo veiculo;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _globalKey = GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    veiculo = ModelVeiculo.forInsert(tipo_veiculo: widget.tipo_veiculo);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => willPop(
        context: context,
        formState: _formKey.currentState,
        hasChanged: false,
        isCreating: true,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.tipo_veiculo == 0 ? Strings.novoAutomovel : Strings.novoMoto,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(Strings.salvar),
                onPressed: () async {
                  final formState = _formKey.currentState;
                  if (formState.validate()) {
                    formState.save();

                    final service = Get.find<ServiceVeiculos>();

                    await AsyncDialog.run(context, _globalKey, () {
                      return widget.tipo_veiculo == 0
                          ? service.createCarro(veiculo)
                          : service.createMoto(veiculo);
                    });
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
                    icon: const Icon(Icons.confirmation_number, color: Colors.amber),
                    label: Strings.placa,
                    initialValue: veiculo.placa,
                    hint: "BBB-AAAA",
                    maxLength: 8,
                    onChanged: (s) {
                      veiculo.opm = s;
                    },
                    validator: (s) => [
                      s.isRequired(errorText: Strings.campoBranco),
                      s.maxLength(8, errorText: Strings.placaInvalida),
                    ].validate(),
                  ),
                  ComposedTextTile(
                    icon: const Icon(Icons.edit, color: Colors.teal),
                    label: Strings.descVeiculo,
                    initialValue: veiculo.veiculo,
                    hint: Strings.hintCarro,
                    validator: (s) => [
                      s.isRequired(errorText: Strings.campoBranco),
                    ].validate(),
                    onChanged: (s) => veiculo.veiculo = s,
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.format_list_numbered, color: Colors.pink),
                    title: const Text(Strings.prefixo),
                    trailing: Text(veiculo.prefixo, style: Get.textTheme.subtitle1),
                    onTap: () async {
                      final pref = await Dialogs.showPrefixPickerDialog(
                        maxLength: 4,
                        context: context,
                        initValue: veiculo.prefixo,
                        label: Strings.prefixo,
                        title: "Prefixo",
                      );
                      if (pref != null && pref.isNotEmpty) {
                        setState(() => veiculo.prefixo = pref);
                      }
                    },
                  ),
                  ListDivider(),
                  SwitchTile(
                    icon: const Icon(MdiIcons.star, color: Colors.orange),
                    initialValue: veiculo.ativa,
                    label: Strings.ativa,
                    onChanged: (b) => setState(() => veiculo.ativa = b),
                  ),
                  ListDivider(),
                  SwitchTile(
                    icon: const Icon(MdiIcons.carTractionControl, color: Colors.blueGrey),
                    initialValue: veiculo.locada,
                    label: Strings.locada,
                    onChanged: (b) => setState(() => veiculo.locada = b),
                  ),
                  ListSectionDecorator(label: Strings.local),
                  DropdownTile<String>(
                    initialValue: veiculo.opm,
                    label: Strings.opm,
                    icon: const Icon(Icons.account_balance, color: Colors.lightGreen),
                    items: Arrays.unidades,
                    formatter: (s) => "$s",
                    onChanged: (s) => setState(() => veiculo.opm = s),
                  ),
                  ListDivider(),
                  DropdownTile<String>(
                    initialValue: veiculo.unidade,
                    label: Strings.unidade,
                    icon: const Icon(Icons.store, color: Colors.blue),
                    items: Arrays.unidades,
                    formatter: (s) => "$s",
                    onChanged: (s) => setState(() => veiculo.unidade = s),
                  ),
                ],
              ),
            ),
          ),
          /*body: Container(
            padding: const EdgeInsets.all(8),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                

              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
