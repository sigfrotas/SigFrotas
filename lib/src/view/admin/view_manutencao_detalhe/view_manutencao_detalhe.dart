import 'package:flutter/material.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_eletrica_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_kilometragem.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_lataria_detalhe.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_manutencao_arrefecimento.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao_detalhe/view_motor_detalhe.dart';
import 'package:sigfrotas/src/view/shared/dialogs.dart';

class ViewManutencaoCarroDetalhe extends StatelessWidget {
  const ViewManutencaoCarroDetalhe({Key key, this.requisicao}) : super(key: key);

  final ModelRequisicao requisicao;

  static final Map<int, Widget> faroisEstado = {
    0: Text(Arrays.farolEstado[0]),
    1: Text(Arrays.farolEstado[1]),
    2: Text(Arrays.farolEstado[2]),
    3: Text(Arrays.farolEstado[3]),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placa: ${requisicao.veiculo.placa}"),
        actions: <Widget>[
          FlatButton(
            child: const Text(Strings.finalizar),
            onPressed: () async {
              final String r = await Dialogs.showOptionsDialog(
                title: Strings.alterarRequisicao,
                context: context,
                options: Arrays.opcoesStatusRequisicao,
              );

              if (r != null) {
                print(r);
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
              kmInicial: requisicao.km_inicial,
              kmTermino: requisicao.km_termino,
            ),
            if (requisicao.alteracao_lataria) ViewLatariaDetalhe(requisicao: requisicao),
            ViewMotorDetalhe(
              nivelOleo: requisicao.qualidade_oleo,
              qualidadeOleo: requisicao.qualidade_oleo,
              localVazamento: requisicao.local_vazamento_oleo,
              vazamentoOleo: requisicao.vazamento_oleo,
            ),
            ViewManutencaoArrefecimento(
              nivelAgua: requisicao.nivel_agua,
              localVazamento: requisicao.local_vazamento_agua,
              vazamentoAgua: requisicao.vazamento_agua,
            ),
            ViewEletricaDetalhe(
              luzAcesa: requisicao.luz_acesa,
              luzAcesaDescricao: requisicao.luz_acesa_descricao,
              diantDir: requisicao.diantDir,
              diantEsq: requisicao.diantEsq,
              trazDir: requisicao.trazDir,
              trazEsq: requisicao.trazEsq,
            ),
          ],
        ),
      ),
    );
  }
}
