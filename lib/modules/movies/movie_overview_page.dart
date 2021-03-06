import 'package:animated_card/animated_card.dart';
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
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: AnimatedCard(
                initDelay: Duration(milliseconds: 0),
                duration: Duration(seconds: 2),
                direction: AnimatedCardDirection.top,
                curve: Curves.decelerate,
                //
                //backdrop do filme
                //
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
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: AnimatedCard(
          initDelay: Duration(milliseconds: 300),
          duration: Duration(seconds: 2),
          direction: AnimatedCardDirection.bottom,
          curve: Curves.decelerate,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //titulo do filme
                    Center(
                      child: Text(
                        args.title,
                        style: TextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //
                    //Sinopse do filme
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Sinopse'.toUpperCase(),
                        style: TextStyles.bodytitle,
                      ),
                    ),
                    Text(
                        overview == ""
                            ? "N??o temos esse dado sobre este t??tulo"
                            : overview,
                        style: TextStyles.bodyRegular),
                    //
                    //Data de lan??amento do filme
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Data de Lan??amento'.toUpperCase(),
                          style: TextStyles.bodytitle),
                    ),
                    Text(
                        releaseDate == null
                            ? "N??o temos esse dado sobre este t??tulo"
                            : DateFormat("dd/MM/yyyy").format(data!),
                        style: TextStyles.bodyRegular),
                    //
                    //M??dia de votos do filme
                    //
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
                    //
                    //N??mero total de votos do filme
                    //
                    Center(
                      child: voteCount == "0"
                          ? Text(
                              "Esse t??tulo ainda n??o possui avalia????es",
                              style: TextStyles.bodyBold,
                            )
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
            ],
          ),
        ),
      ),
    );
  }
}
