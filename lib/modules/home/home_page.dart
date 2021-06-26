import 'package:dart_movies/modules/movies/movie.dart';
import 'package:dart_movies/modules/movies/movies_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final moviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;
  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Movies"),
      ),
      body: watch(moviesFutureProvider).when,
    );
  }
}
