import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/default_result.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao/view_manutencao.dart';
import 'package:sigfrotas/src/view/motorista/conduto_list_veiculos/condutor_list_veiculos.dart';
import 'package:sigfrotas/src/view/motorista/view_condutor_relacao/view_condutor_relacao.dart';
import 'package:sigfrotas/src/view/motorista/view_ultimo_proc.dart';
import 'package:sigfrotas/src/view/shared/view_base.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

class ViewMotorista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      cardContent: ViewUltimaProc(),
      menuItems: [
        BottomMenuItem(
          icon: Icons.directions_car,
          label: Strings.automovel,
          onTap: () async {
            final r = await Get.to<DefaultResult>(
              const CondutorListVeiculos(tipoVeiculo: 0),
            );

            print(r);
          },
        ),
        BottomMenuItem(
          icon: Icons.motorcycle,
          label: Strings.motocicleta,
          onTap: () async {
            await Get.to<DefaultResult>(
              const CondutorListVeiculos(tipoVeiculo: 1),
            );
          },
        ),
        BottomMenuItem(
          icon: Icons.local_gas_station,
          label: Strings.combustivel,
          onTap: () {
            Get.snackbar("Não implementado",
                "Recurso para gestão de utilização de combustíveis ainda não está disponível");
          },
        ),
        BottomMenuItem(
          icon: Icons.chrome_reader_mode,
          label: Strings.relatorios,
          onTap: () async {
            await Get.to<void>(ViewManutencao(isMotomec: false));
          },
        ),
      ],
    );
  }
}
