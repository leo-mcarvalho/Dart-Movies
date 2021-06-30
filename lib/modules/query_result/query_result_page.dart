import 'dart:ui';

import 'package:dart_movies/modules/movies/movies_from_query.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:dart_movies/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueryResultPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body: Stack(children: [
      MoviesFromQuery(),
      Positioned(
        top: 30,
        child: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
        ),
      ),
      isPortrait
          ? Positioned(
              left: 80,
              right: 0,
              top: 90,
              child: Text(
                "Resultados da pesquisa",
                style: TextStyles.titleBoldHeading,
              ),
            )
          : Positioned(
              left: 300,
              right: 0,
              top: 90,
              child: Text(
                "Resultados da pesquisa",
                style: TextStyles.titleBoldHeading,
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
