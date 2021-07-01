import 'package:dart_movies/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:dart_movies/themes/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'movie.dart';

class MovieOverviewPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Movie;
    String overview = args.overview!;
    String? releaseDate = args.releaseDate;
    String? backdropPath = args.backdropPath;
    String? voteAverage = args.voteAverage;
    String? voteCount = args.voteCount;
    DateTime? data;
    if (releaseDate != null) {
      data = DateTime.parse(releaseDate);
    }
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: PreferredSize(
          //preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 2),
          preferredSize: Size.fromHeight(size.height * 0.35),
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
                            : NetworkImage("https://i.imgur.com/Td2lqn5.jpg"),
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
                          Center(
                            child: Text(
                              args.title,
                              style: TextStyles.titleHome,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Sinopse'.toUpperCase(),
                              style: TextStyles.bodytitle,
                            ),
                          ),
                          Text(
                              overview == ""
                                  ? "Não temos esse dado sobre este título"
                                  : overview,
                              style: TextStyles.bodyRegular),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text('Data de Lançamento'.toUpperCase(),
                                style: TextStyles.bodytitle),
                          ),
                          Text(
                              releaseDate == null
                                  ? "Não temos esse dado sobre este título"
                                  : DateFormat("dd/MM/yyyy").format(data!),
                              style: TextStyles.bodyRegular),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: AppColors.primary),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("$voteAverage/10",
                                      style: TextStyles.rating),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: voteCount == "0"
                                ? Text(
                                    "Esse título ainda não possui avaliações")
                                : Text.rich(
                                    TextSpan(
                                        text: "Nota baseada em ",
                                        style: TextStyles.bodytitle,
                                        children: [
                                          TextSpan(
                                            text: "$voteCount votos",
                                            style: TextStyles.bodyBold,
                                          )
                                        ]),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}
