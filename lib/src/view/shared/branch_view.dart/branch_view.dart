///Coding: UTF-8

///Arquivo: branch_view.dart
///Criado em: "16/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget que verica dados de login e direciona o usuário para LoginView, ViewSignin, ViewAdmin e ViewMotorista

///------------------------------------------------------------------------------------

///Importando Material do SDK padrão, VaultData da pasta src/model, Vault e Inject da pasta src/utils
///e os Widgets ViewAdmin, ViewMotorista, LoginView e ViewSignin da pasta src/view

import 'package:flutter/material.dart';
import 'package:sigfrotas/src/model/vault_data.dart';
import 'package:sigfrotas/src/utils/injector.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/admin/view_admin.dart';
import 'package:sigfrotas/src/view/motorista/view_motorista.dart';
import 'package:sigfrotas/src/view/shared/login/view_login.dart';
import 'package:sigfrotas/src/view/shared/signin/view_signin.dart';

///Widget que alterna entre [LoginView], [ViewSignin]
///E a partir dos dados de login, redireciona para [ViewAdmin] ou [ViewMotorista]
class BranchView extends StatefulWidget {
  const BranchView({
    @required this.data,
    Key key,
  }) : super(key: key);

  final VaultData data;

  @override
  _BranchViewState createState() => _BranchViewState();
}

class _BranchViewState extends State<BranchView> with SingleTickerProviderStateMixin {
  int position;
  bool isAdmin;
  String token;

  ///Checa existência do token de acesso e inicializa [position] inicial
  @override
  void initState() {
    isAdmin = widget.data.isAdmin;
    token = widget.data.token;
    if (token.isEmpty) {
      position = 0;
    } else {
      position = isAdmin ? 2 : 3;
    }

    super.initState();
  }

  ///Se não há token, renderiza [LoginView]
  ///Se há token, checa o tipo do usuário e redireciona conforme o tipo
  ///Tipo 0 - [ViewAdmin]
  ///Tipo 1 - [ViewMotorista]
  Widget getActualView(int pos, bool isAdmin) {
    switch (pos) {
      case 0:
        return LoginView(setPosition: setPosition);
        break;
      case 1:
        return ViewSignin(setPosition: setPosition);
        break;
      case 2:
        Injector.inject(token);
        return ViewAdmin();
        break;
      case 3:
        Injector.inject(token);
        return ViewMotorista();
      default:
        return Container(
          color: Theme.of(context).accentColor,
        );
    }
  }

  ///Busca Token no secure_storage
  Future<String> findToken() async {
    return await Vault.getToken();
  }

  ///Coloca a posição de qual [Widget] deve ser renderizado
  void setPosition(int position, bool isAdmin, String token) {
    setState(() {
      this.position = position;
      this.isAdmin = isAdmin;
      this.token = token;
    });
  }


  ///Renderiza um [AnimatedSwitcher] com a child variando conforme a [position]
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: getActualView(position, isAdmin),
      duration: const Duration(milliseconds: 400),
    );
  }
}
