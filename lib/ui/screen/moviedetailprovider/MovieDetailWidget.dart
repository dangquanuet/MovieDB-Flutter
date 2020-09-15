import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/util/Utils.dart';
import 'package:provider/provider.dart';

import 'MovieDetailModel.dart';

/// build MovieListWidget with ChangeNotifierProvider
Widget buildMovieDetailWidget(Movie movie) {
  return ChangeNotifierProvider<MovieDetailModel>(
    create: (context) => MovieDetailModel(),
    child: MovieDetailWidget(
      movie: movie,
    ),
  );
}

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;

  MovieDetailWidget({
    @required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: movie.title,
                child: Container(
                  height: 400,
                  child: CachedNetworkImage(
                    imageUrl: getLargeImageUrl(
                      imagePath: movie.posterPath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                openFullImage(context: context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                    top: 16,
                  )),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 2,
                        ),
                      ),
                      Text(
                        movie.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                      ),
                      Text(
                        movie.releaseDate,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 16,
                    ),
                  ),
                  Text(
                    movie.overview,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openFullImage({
    @required BuildContext context,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullImage(
          movie: movie,
        ),
      ),
    );
  }
}

class FullImage extends StatelessWidget {
  Movie movie;

  FullImage({
    @required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: movie.title,
          child: CachedNetworkImage(
            imageUrl: getLargeImageUrl(
              imagePath: movie.posterPath,
            ),
          ),
        ),
      ),
    );
  }
}
