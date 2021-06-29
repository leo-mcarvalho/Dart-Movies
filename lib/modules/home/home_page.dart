import 'dart:ui';

import 'package:dart_movies/modules/movies/movie_image.dart';
import 'package:dart_movies/themes/app_colors.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dart_movies/modules/movies/movie.dart';
import 'package:dart_movies/modules/movies/movies_service.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});

class HomePage extends ConsumerWidget {
  get backgroundColor => null;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                      children: movies
                          .map((movie) => MovieImage(movie: movie))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ),
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
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
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
            children: Colors.accents.map((color) {
              return Container(height: 112, color: color);
            }).toList(),
          ),
        ),
      );
    },
  );
}
