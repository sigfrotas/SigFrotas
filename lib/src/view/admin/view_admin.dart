import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/pages/home/widgets/bottom_menu/bottom_menu.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

class ViewAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Admin"),
      ),
      body: Container(color: Get.theme.cardColor),
      bottomNavigationBar: BottomMenu(
        items: <BottomMenuItem>[
          BottomMenuItem(
            icon: Icons.directions_car,
            label: Strings.veiculos,
            onTap: () {},
          ),
          BottomMenuItem(
            icon: Icons.build,
            label: Strings.manutencao,
            onTap: () {},
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
      ),
    );
  }
}
