import 'package:dart_movies/modules/movies/movie_overview_page.dart';
import 'package:dart_movies/modules/query_result/query_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  AppWidget() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Dart Movies',
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/overview": (context) => MovieOverviewPage(),
        "/query": (context) => QueryResultPage(),
      },
    );
  }
}
