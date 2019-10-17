import 'package:flutter/material.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/ui/screens/moviedetail/movie_detail_bloc.dart';
import 'package:moviedb_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

/// build MovieListWidget with ChangeNotifierProvider
Widget buildMovieDetailWidget(Movie movie) {
  return ChangeNotifierProvider<MovieDetailBloc>(
    builder: (context) => MovieDetailBloc(),
    child: MovieDetailWidget(movie),
  );
}

class MovieDetailWidget extends StatelessWidget {
  final Movie movie;

  MovieDetailWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                    getLargeImageUrl(movie.posterPath),
                    fit: BoxFit.cover,
                  )),
                ),
              ];
            },
            body: ListView(
              children: <Widget>[
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
      ),
    );
  }
}
