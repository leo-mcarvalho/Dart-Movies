import 'dart:convert';

class Movie {
  final String title;
  final String? poster_path;
  final String? overview;
  final String? release_date;
  final String? backdrop_path;

  Movie({
    required this.title,
    this.poster_path,
    this.overview,
    this.release_date,
    this.backdrop_path,
  });
  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$poster_path';
  String get fullBackdropUrl =>
      'https://image.tmdb.org/t/p/original/$backdrop_path';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': poster_path,
      'overview': overview,
      'releaseDate': release_date,
      'backdrop_path': backdrop_path,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      poster_path: map['poster_path'],
      overview: map['overview'],
      release_date: map['release_date'],
      backdrop_path: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
