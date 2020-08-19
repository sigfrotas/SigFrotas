///Coding: UTF-8

///Arquivo: app_logo.dart
///Criado em: "19/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Widget contendo uma imagem do logotipo da aplicação

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.fitWidth,
        height: Get.height * 0.2,
      ),
    );
  }
}
