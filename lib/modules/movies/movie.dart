import 'dart:convert';

class Movie {
  final String title;
  final String? posterPath;
  final String? overview;
  final String? releaseDate;
  final String? backdropPath;
  final String? voteAverage;
  final String? voteCount;

  Movie({
    this.voteAverage,
    this.voteCount,
    required this.title,
    this.posterPath,
    this.overview,
    this.releaseDate,
    this.backdropPath,
  });
  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';
  String get fullBackdropUrl =>
      'https://image.tmdb.org/t/p/original/$backdropPath';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'release_date': releaseDate,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      posterPath: map['poster_path'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      backdropPath: map['backdrop_path'],
      voteAverage: map['vote_average'].toString(),
      voteCount: map['vote_count'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
