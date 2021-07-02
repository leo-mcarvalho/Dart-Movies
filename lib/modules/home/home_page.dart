import 'dart:ui';

import 'package:dart_movies/modules/home/searchbar_ui.dart';
import 'package:dart_movies/modules/movies/popular_movies.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:dart_movies/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    final logoSizeWidth = size * 0.12;
    final logoSizeHeight = sizeHeight * 0.11;
    double topPadding = sizeHeight * 0.014;
    return Scaffold(
      body: Stack(
        children: [
          PopularMovies(),
          Positioned(
            top: topPadding,
            child: Container(
              alignment: Alignment.topLeft,
              height: logoSizeHeight,
              constraints: BoxConstraints(maxHeight: logoSizeHeight),
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Stack(children: <Widget>[
                  Opacity(
                      child: Image.asset(AppImages.logoHome,
                          width: logoSizeWidth,
                          height: logoSizeHeight,
                          color: Colors.black),
                      opacity: 0.2),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Image.asset(
                        AppImages.logoHome,
                        width: logoSizeWidth,
                        height: logoSizeHeight,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          searchBarUI(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Text(
                  "Filmes Populares",
                  style: TextStyles.titleBoldHeading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
