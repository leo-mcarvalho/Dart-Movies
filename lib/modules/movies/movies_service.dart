import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../environment_config.dart';
import 'movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(
    this._environmentConfig,
    this._dio,
  );
  final Dio _dio;
  final EnvironmentConfig _environmentConfig;

  Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=pt-BR&page=1");
    final results = List<Map<String, dynamic>>.from(response.data['results']);
    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: false);
    return movies;
  }
}
