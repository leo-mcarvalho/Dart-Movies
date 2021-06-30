import 'dart:ui';

import 'package:dart_movies/modules/movies/movies_from_query.dart';
import 'package:dart_movies/modules/movies/popular_movies.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueryResultPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body: Stack(children: [
      MoviesFromQuery(),
      Positioned(
        left: 10,
        right: 200,
        top: 90,
        child: Text(
          "Resultados da pesquisa",
        ),
      ),
      Positioned(
        left: 10,
        right: 0,
        top: 30,
        child: Center(
          child: Stack(children: <Widget>[
            Opacity(
                child: Image.asset(AppImages.logoHome,
                    width: 45, height: 45, color: Colors.black),
                opacity: 0.2),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Image.asset(
                  AppImages.logoHome,
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          ]),
        ),
      ),
    ]));
  }
}
