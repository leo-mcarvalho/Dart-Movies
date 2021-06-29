import 'package:dart_movies/modules/movies/movie_overview_page.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

class MovieImage extends StatelessWidget {
  final Movie movie;
  const MovieImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            movie.fullImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/overview",
                arguments: movie);
          },
        )
      ],
    );
  }
}
