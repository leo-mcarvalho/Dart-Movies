import 'package:dart_movies/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie.dart';
import 'movie_image.dart';
import 'movies_service.dart';

class MoviesFromQuery extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final moviesFutureProvider = ModalRoute.of(context)!.settings.arguments
        as AutoDisposeFutureProvider<List<Movie>>;
    return Container(
      color: AppColors.grey,
      child: watch(moviesFutureProvider).when(
        error: (e, s) {
          return Text("Oops, Algo inesperado ocorreu");
        },
        loading: () => Center(child: CircularProgressIndicator()),
        data: (movies) {
          return RefreshIndicator(
            onRefresh: () {
              return context.refresh(moviesFutureProvider);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 120),
              child: GridView.extent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.7,
                children:
                    movies.map((movie) => MovieImage(movie: movie)).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
