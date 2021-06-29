import 'package:dart_movies/modules/movies/movie.dart';
import 'package:dart_movies/modules/movies/movie_overview_page.dart';
import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Movies',
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/overview": (context) => MovieOverviewPage(),
      },
    );
  }
}
