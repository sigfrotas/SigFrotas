import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/admin/view_counter.dart';
import 'package:sigfrotas/src/view/shared/view_base.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

import 'view_list_veiculos/view_admin_veiculos.dart';

class ViewAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewBase(
      cardContent: ViewCounter(),
      menuItems: [
        BottomMenuItem(
          icon: Icons.directions_car,
          label: Strings.veiculos,
          onTap: () async {

            ///TODO - Verificar se deve tratar algum retorno daqui
            final r = await Get.to<void>(ViewAdminVeiculos());
          },
        ),
        BottomMenuItem(
          icon: Icons.build,
          label: Strings.manutencao,
          onTap: () {},
        ),
        BottomMenuItem(
          icon: Icons.chrome_reader_mode,
          label: Strings.relatorios,
          onTap: () {},
        ),
        BottomMenuItem(
          icon: Icons.local_gas_station,
          label: Strings.combustivel,
          onTap: () {},
        ),
      ],
    );
  }
}
