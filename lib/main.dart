import 'package:dart_movies/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Movies',
      theme: ThemeData(primaryColor: AppColors.background),
      home: SplashPage(),
    );
  }
}
