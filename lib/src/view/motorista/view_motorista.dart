import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/server/model_requisicao.dart';
import 'package:sigfrotas/src/view/motorista/conduto_list_veiculos/condutor_list_veiculos.dart';
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
          onTap: () {
            Get.to<CondutorListVeiculos>(
              const CondutorListVeiculos(tipoVeiculo: 0),
            );
          },
        ),
        BottomMenuItem(
          icon: Icons.motorcycle,
          label: Strings.motocicleta,
          onTap: () async {
            final result = await Get.to<ModelRequisicao>(
              const CondutorListVeiculos(tipoVeiculo: 1),
            );

            if (result != null) {
              //TODO - Adicionar ultima_requisicao ao widget
            }
          },
        ),
        BottomMenuItem(
          icon: Icons.local_gas_station,
          label: Strings.combustivel,
          onTap: () {},
        ),
        BottomMenuItem(
          icon: Icons.chrome_reader_mode,
          label: Strings.relatorios,
          onTap: () {},
        ),
      ],
    );
  }
}
