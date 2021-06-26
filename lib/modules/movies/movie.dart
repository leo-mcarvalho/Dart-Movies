import 'dart:convert';

class Movie {
  final String title;
  final String poster_path;
  final String overview;
  final String releaseDate;
  Movie({
    required this.title,
    required this.poster_path,
    required this.overview,
    required this.releaseDate,
  });
  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$poster_path';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': poster_path,
      'overview': overview,
      'releaseDate': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      poster_path: map['poster_path'],
      overview: map['overview'],
      releaseDate: map['releaseDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
