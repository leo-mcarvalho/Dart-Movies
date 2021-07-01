import 'package:animated_card/animated_card.dart';
import 'package:dart_movies/themes/app_images.dart';
import 'package:dart_movies/themes/app_text_styles.dart';
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
    if (movie.posterPath == null) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              AppImages.posterUnknown,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(17),
            child: Text(
              movie.title,
              style: TextStyles.bodyRegular,
              textAlign: TextAlign.center,
            ),
          )),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/overview",
                  arguments: movie);
            },
          )
        ],
      );
    } else {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
}
