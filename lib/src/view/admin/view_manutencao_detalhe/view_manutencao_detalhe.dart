import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/services/service_requisicao.dart';
import 'package:sigfrotas/src/utils/awaitable_action.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_eletrica_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_kilometragem.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_lataria_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_manutencao_arrefecimento.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_motor_detalhe.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

class ViewManutencaoCarroDetalhe extends StatefulWidget {
  const ViewManutencaoCarroDetalhe({Key key, this.requisicao}) : super(key: key);

  final ModelRequisicao requisicao;

  static final Map<int, Widget> faroisEstado = {
    0: Text(Arrays.farolEstado[0]),
    1: Text(Arrays.farolEstado[1]),
    2: Text(Arrays.farolEstado[2]),
    3: Text(Arrays.farolEstado[3]),
  };

  @override
  _ViewManutencaoCarroDetalheState createState() => _ViewManutencaoCarroDetalheState();
}

class _ViewManutencaoCarroDetalheState extends State<ViewManutencaoCarroDetalhe> {
  final _gk = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placa: ${widget.requisicao.veiculo.placa}"),
        actions: <Widget>[
          if (widget.requisicao.status == 0)
            FlatButton(
              child: const Text(Strings.finalizar),
              onPressed: () async {
                final int r = await Dialogs.showOptionsDialog(
                  title: Strings.alterarRequisicao,
                  context: context,
                  options: Arrays.opcoesStatusRequisicao,
                );

                if (r != null) {
                  if (r == 0) {
                    await AsyncDialog.run(context, _gk, () {
                      return Get.find<ServiceRequisicao>().cancelRequisicao(widget.requisicao.id);
                    });
                  } else if (r == 1) {
                    await AsyncDialog.run(context, _gk, () {
                      return Get.find<ServiceRequisicao>().finishRequisicao(widget.requisicao.id);
                    });
                  }

                  Get.back();
                }
              },
            )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            ViewKilometragem(
              kmInicial: widget.requisicao.km_inicial,
              kmTermino: widget.requisicao.km_termino,
            ),
            if (widget.requisicao.alteracao_lataria)
              ViewLatariaDetalhe(requisicao: widget.requisicao),
            ViewMotorDetalhe(
              nivelOleo: widget.requisicao.qualidade_oleo,
              qualidadeOleo: widget.requisicao.qualidade_oleo,
              localVazamento: widget.requisicao.local_vazamento_oleo,
              vazamentoOleo: widget.requisicao.vazamento_oleo,
            ),
            ViewManutencaoArrefecimento(
              nivelAgua: widget.requisicao.nivel_agua,
              localVazamento: widget.requisicao.local_vazamento_agua,
              vazamentoAgua: widget.requisicao.vazamento_agua,
            ),
            ViewEletricaDetalhe(
              luzAcesa: widget.requisicao.luz_acesa,
              luzAcesaDescricao: widget.requisicao.luz_acesa_descricao,
              diantDir: widget.requisicao.diantDir,
              diantEsq: widget.requisicao.diantEsq,
              trazDir: widget.requisicao.trazDir,
              trazEsq: widget.requisicao.trazEsq,
            ),
          ],
        ),
      ),
    );
  }
}
