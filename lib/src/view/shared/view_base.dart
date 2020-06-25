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
