import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/consts.dart';
import 'package:sigfrotas/pages/splash/splash_page.dart';

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
      home: SplashScreen(),
    );
  }
}
