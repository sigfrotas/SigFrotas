import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao_motos.dart';
import 'package:sigfrotas/src/services/service_requisicao_motos.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_circunstancia.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_lataria.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_limpeza.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_motos_detalhe/view_manutencao_moto_pneu.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';
import 'package:sigfrotas/src/view/shared/widget/list_section_decorator.dart';

class ViewManutencaoMotosDetalhe extends StatefulWidget {
  const ViewManutencaoMotosDetalhe({
    @required this.requisicao,
    @required this.editable,
    Key key,
  }) : super(key: key);

  final ModelRequisicaoMoto requisicao;
  final bool editable;

  @override
  _ViewManutencaoMotosDetalheState createState() => _ViewManutencaoMotosDetalheState();
}

class _ViewManutencaoMotosDetalheState extends State<ViewManutencaoMotosDetalhe> {
  final _gk = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.requisicao.veiculo.placa),
        actions: <Widget>[
          if (widget.editable)
            FlatButton(
              child: const Text("Finalizar"),
              onPressed: () async {
                final int r = await Dialogs.showOptionsDialog(
                  title: Strings.alterarRequisicao,
                  context: context,
                  options: Arrays.opcoesStatusRequisicao,
                );

                if (r != null) {
                  if (r == 0) {
                    await AsyncDialog.run(
                      context,
                      _gk,
                      () =>
                          Get.find<ServiceRequisicaoMotos>().cancelRequisicao(widget.requisicao.id),
                    );
                  } else if (r == 1) {
                    await AsyncDialog.run(
                      context,
                      _gk,
                      () =>
                          Get.find<ServiceRequisicaoMotos>().finishRequisicao(widget.requisicao.id),
                    );
                  }

                  Get.back();
                }
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.teal),
              title: const Text("Kilometragem"),
              trailing: Text("${widget.requisicao.km} km"),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.amber),
              title: const Text("Combustivel"),
              trailing: Text("${widget.requisicao.combustivel} litros"),
            ),
            ViewManutencaoMotoCircunstancia(
              circunstancia: widget.requisicao.circunstancia,
              onValueChanged: (_) {},
            ),
            ListSectionDecorator(label: "Carenagem:"),
            ViewManutencaoMotoLimpeza(
              limpeza: widget.requisicao.limpeza,
              onValueChanged: (_) {},
            ),
            ViewManutencaoMotoLataria(
              label: "Lado Direito",
              lataria: widget.requisicao.ladoDireito,
              onValueChanged: (_) {},
            ),
            ViewManutencaoMotoLataria(
              label: "Lado Esquerdo",
              lataria: widget.requisicao.ladoEsquerdo,
              onValueChanged: (_) {},
            ),
            ViewManutencaoMotoLataria(
              label: "Parte Superior",
              lataria: widget.requisicao.superior,
              onValueChanged: (_) {},
            ),
            ViewManutencaoMotoLataria(
              label: "Parte Interna",
              lataria: widget.requisicao.interna,
              onValueChanged: (_) {},
            ),
            ListSectionDecorator(label: "Pneus"),
            ViewManutencaoMotoPneu(
              label: "Pneu Dianteiro",
              pneu: widget.requisicao.pneusDianteiro,
              onValueChanged: (_) {},
            ),
            ViewManutencaoMotoPneu(
              label: "Pneu Trazeiro",
              pneu: widget.requisicao.pneusTrazeiro,
              onValueChanged: (_) {},
            )
          ],
        ),
      ),
    );
  }
}
