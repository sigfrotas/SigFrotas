///Coding: UTF-8

///Arquivo: view_base.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Tela base, contendo um card e um menu de navegação de rodapé

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, FutureObserver do pacote lib_observer
///Vault de /src/utils
///Widgets da pasta /src/view

import 'package:flutter/material.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/shared/widget/basic_card.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_menu_item.dart';
import 'package:sigfrotas/src/view/shared/widget/bottom_navigation_bar.dart';

class ViewBase extends StatelessWidget {
  const ViewBase({
    @required this.cardContent,
    @required this.menuItems,
    Key key,
  }) : super(key: key);

  final Widget cardContent;
  final List<BottomMenuItem> menuItems;

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
            child: cardContent,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        items: menuItems,
      ),
    );
  }
}
