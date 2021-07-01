import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../movies/movie.dart';
import '../movies/movies_service.dart';

Widget searchBarUI(context) {
  final size = MediaQuery.of(context).size;
  return FloatingSearchBar(
    hint: 'Pesquisar...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: 1,
    openAxisAlignment: 0.0,
    width: size.width * 0.83,
    onSubmitted: (query) async {
      final moviesFutureProvider =
          FutureProvider.autoDispose<List<Movie>>((ref) async {
        ref.maintainState = true;
        final movieService = ref.watch(movieServiceProvider);
        final movies = movieService.getMoviesFromQuery(query);
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
