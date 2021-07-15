import 'dart:ui';

import 'package:dart_movies/modules/query_result/movies_from_query.dart';
import 'package:dart_movies/themes/app_colors.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:dart_movies/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueryResultPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        body: Container(
      color: AppColors.grey,
      child: Stack(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 95),
                child: Text(
                  "Resultados da pesquisa",
                  style: TextStyles.titlePages,
                ),
              ),
            ]),
        MoviesFromQuery(),
        Positioned(
          top: 40,
          child: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
          ),
        ),
      ]),
    ));
  }
}
