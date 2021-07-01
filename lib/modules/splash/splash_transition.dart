import 'package:flutter/material.dart';

class SplashTransition {
  Future<void> aguarde(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, "/home");
  }
}
