import 'dart:ui';
import 'package:dart_movies/modules/movies/movie.dart';
import 'package:dart_movies/modules/movies/movies_service.dart';
import 'package:dart_movies/modules/movies/popular_movies.dart';
import 'package:dart_movies/modules/searchBarUI.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:dart_movies/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          PopularMovies(),
          isPortrait
              ? Positioned(
                  left: 125,
                  right: 0,
                  top: 90,
                  child: Text(
                    "Filmes Populares",
                    style: TextStyles.titleBoldHeading,
                  ),
                )
              : Positioned(
                  left: 300,
                  right: 0,
                  top: 90,
                  child: Text(
                    "Filmes Populares",
                    style: TextStyles.titleBoldHeading,
                  ),
                ),
          Positioned(
            left: 10,
            right: 0,
            top: 30,
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
          searchBarUI(context),
        ],
      ),
    );
  }
}
