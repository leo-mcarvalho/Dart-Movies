import 'package:flutter/material.dart';

class SplashTransition {
  Future<void> aguarde(context) async {
    await Future.delayed(const Duration(milliseconds: 3500));
    goToHome(context);
  }

  void goToHome(context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
}
