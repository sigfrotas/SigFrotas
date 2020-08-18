///Coding: UTF-8

///Arquivo: view_admin.dart
///Criado em: "16/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Tela que exibe veículos cadastrados e menu de navegação

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX
///classe de Strings do arquivo consts.dart
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/view/admin/view_counter.dart';
import 'package:sigfrotas/src/view/admin/view_list_veiculos/view_admin_veiculos.dart';
import 'package:sigfrotas/src/view/admin/view_manutencao/view_manutencao.dart';
import 'package:sigfrotas/src/view/shared/view_base.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';

///renderiza tela com widget exibindo última requição
///[BottomNavigationBar] com rotas para as telas:
///[ViewAdminVeiculos] para listar automóveis e motos cadastrados
///[ViewManutencao] para listar histórico de manutenções geral
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
            await Get.to<void>(ViewAdminVeiculos());
          },
        ),
        BottomMenuItem(
          icon: Icons.build,
          label: Strings.manutencao,
          onTap: () async {
            await Get.to<void>(ViewManutencao(isMotomec: true));
          },
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
