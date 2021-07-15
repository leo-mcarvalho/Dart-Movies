import 'package:flutter/material.dart';

class SplashTransition {
  Future<void> aguarde(context) async {
    return await Future.delayed(const Duration(milliseconds: 3500), () {
      return Navigator.pushReplacementNamed(context, "/home");
    });
  }
}
