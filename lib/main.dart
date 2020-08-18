///Coding: UTF-8

///Arquivo: main.dart
///Criado em: "17/08/2020"
///Autores: Elias Ribeiro Pereira
///         Jandeson Barbosa da Conceição
///         Felipe Ferreira de Sousa
///Descrição: Arquivo contendo as classes que inicializam o aplicativo, definem layout e primeira tela a ser visualizada 

///-----------------------------------------------------------------------------------

///Importando material do SDK padrão, Get do pacote GetX, FutureObserver do pacote lib_observer, arquivo de contantes
///Vault da pasta src/utils, VaultData da pasta src/model, BranchView da pasta /view/shared

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lib_observer/lib_observer.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/src/model/vault_data.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/shared/branch_view.dart/branch_view.dart';

void main() async {
  runApp(
    MyApp(),
  );
}

///Instancia a classe MaterialApp, que é a raiz da aplicação, define ThemeData e renderiza o BranchView
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        accentColor: Colors.red,
        backgroundColor: ThemeData.light().backgroundColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          brightness: Brightness.light,
          iconTheme: ThemeData.light().iconTheme,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.black45,
        ),
      ),      
      home: FutureObserver<VaultData>(
        future: Vault.getDefaultInfo(),
        onSuccess: (_, data) => BranchView(data: data),
      ),
    );
  }
}
