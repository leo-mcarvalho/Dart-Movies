import 'dart:ui';
import 'package:dart_movies/modules/movies/movie.dart';
import 'package:dart_movies/modules/movies/movies_service.dart';
import 'package:dart_movies/modules/movies/popular_movies.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          PopularMovies(),
          Positioned(
            left: 10,
            right: 200,
            top: 90,
            child: Text(
              "Filmes Populares",
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

Widget searchBarUI(context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return FloatingSearchBar(
    hint: 'Pesquisar...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 1 : -1.0,
    openAxisAlignment: 0.0,
    width: isPortrait ? 340 : 500,
    onSubmitted: (query) async {
      final moviesFutureProvider =
          FutureProvider.autoDispose<List<Movie>>((ref) async {
        ref.maintainState = true;
        final movieService = ref.watch(movieServiceProvider);
        final movies = movieService.getMoviesFromQuery(query);
        print(movies);
        return movies;
      });
      Navigator.pushReplacementNamed(context, "/query",
          arguments: moviesFutureProvider);
    },

    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.movie),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      );
    },
  );
}
