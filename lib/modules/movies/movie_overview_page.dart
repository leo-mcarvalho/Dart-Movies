import 'package:dart_movies/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:dart_movies/themes/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movie.dart';

class MovieOverviewPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final args = ModalRoute.of(context)!.settings.arguments as Movie;
    String? overview = args.overview;
    String? releaseDate = args.release_date;
    String? backdropPath = args.backdrop_path;
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: PreferredSize(
          //preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 2),
          preferredSize: Size.fromHeight(350),
          child: AppBar(
              backgroundColor: AppColors.grey,
              elevation: 0,
              leading: BackButton(
                color: Colors.white,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
              ),
              flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: backdropPath != null
                            ? NetworkImage(args.fullBackdropUrl)
                            : NetworkImage("https://i.imgur.com/pjEVaz5.jpeg"),
                        fit: BoxFit.fill),
                    // child: Image.network(
                    //   args.fullBackdropUrl,
                    //   fit: BoxFit.fill,
                  ),
                ),
              )),
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(args.title),
                          Text('Sinopse'.toUpperCase()),
                          Text(overview == null
                              ? "Não temos esse dado sobre este título"
                              : overview),
                          Text('Data de Lançamento'.toUpperCase()),
                          Text(releaseDate == null
                              ? "Não temos esse dado sobre este título"
                              : releaseDate),
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}
