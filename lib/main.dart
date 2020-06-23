import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        accentColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 2,
          brightness: Brightness.light,
          iconTheme: ThemeData.light().iconTheme,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
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
