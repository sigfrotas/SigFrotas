import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nubank_tutorial/pages/home/home_page.dart';

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

  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  initScreen(BuildContext context) {
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
            Padding(padding: EdgeInsets.only(top: 40.0)),
            Padding(padding: EdgeInsets.only(top: 20.0)),
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
