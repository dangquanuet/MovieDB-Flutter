import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/ui/screens/moviedetail/movie_detail_bloc.dart';
import 'package:moviedb_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

/// build MovieListWidget with ChangeNotifierProvider
Widget buildMovieDetailWidget(Movie movie) {
  return ChangeNotifierProvider<MovieDetailBloc>(
    create: (context) => MovieDetailBloc(),
    child: MovieDetailWidget(movie),
  );
}

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;
  final imagePosterTag = 'image-poster';

  MovieDetailWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 200,
                  child: Hero(
                    tag: imagePosterTag,
                    child: Image.network(
                      getLargeImageUrl(movie.posterPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: Center(
                              child: Hero(
                                  tag: imagePosterTag,
                                  child: Image.network(
                                      getLargeImageUrl(movie.posterPath))),
                            ),
                          )));
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
                    Container(margin: EdgeInsets.only(top: 16)),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 2),
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                        ),
                        Text(
                          movie.releaseDate,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.only(top: 16)),
                    Text(movie.overview),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
