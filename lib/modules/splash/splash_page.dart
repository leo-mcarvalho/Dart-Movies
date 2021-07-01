import 'package:dart_movies/themes/app_colors.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:flutter/material.dart';

import 'splash_transition.dart';

// ignore: use_key_in_widget_constructors
class SplashPage extends StatelessWidget {
  final delay = SplashTransition();
  @override
  Widget build(BuildContext context) {
    delay.aguarde(context);
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.ball)),
          Center(child: Image.asset(AppImages.logo)),
        ],
      ),
    );
  }
}
