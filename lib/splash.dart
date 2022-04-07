import 'package:dartists/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  void onReady() {
    moveToNext();
  }

  Future<void> moveToNext() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Get.to(MyHomePage());
  }

  Widget build(BuildContext context) {
    onReady();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/logo.jpeg",
              height: 300,
              width: 300,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.deepPurple,
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
