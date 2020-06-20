import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/motorista/view_list_veiculo/view_list_veiculo.dart';
import 'package:sigfrotas/src/view/motorista/view_ultimo_proc.dart';
import 'package:sigfrotas/src/view/shared/widget/basic_card.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_navigation_bar.dart';

class ViewMotorista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureObserver<String>(
          future: Vault.getNome(),
          onSuccess: (_, String nome) => Text(nome),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BasicCard(
            child: ViewUltimaProc(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        items: [
          BottomMenuItem(
            icon: Icons.directions_car,
            label: Strings.automovel,
            onTap: () {
              Get.to<ViewListVeiculo>(
                const ViewListVeiculo(tipoVeiculo: 0),
              );
            },
          ),
          BottomMenuItem(
            icon: Icons.motorcycle,
            label: Strings.motocicleta,
            onTap: () {
              Get.to<ViewListVeiculo>(
                const ViewListVeiculo(tipoVeiculo: 1),
              );
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
      ),
    );
  }
}
