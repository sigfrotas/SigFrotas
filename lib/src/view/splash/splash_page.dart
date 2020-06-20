import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigfrotas/src/utils/vault.dart';
import 'package:sigfrotas/src/view/shared/branch_view.dart/branch_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<Timer> startTimer() async {
    const duration = Duration(seconds: 2);
    return Timer(duration, () async {
      await Get.off<BranchView>(
        BranchView(
          data: await Vault.getDefaultInfo(),
        ),
      );
    });
  }

  Widget initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                height: 50,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              backgroundColor: Colors.indigo[900],
              strokeWidth: 4,
            )
          ],
        ),
      ),
    );
  }
}
