import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/di/ServiceLocator.dart';
import 'package:moviedb_flutter/ui/screen/moviedetailprovider/MovieDetailWidget.dart';
import 'package:moviedb_flutter/ui/screen/movielistbloc/MovieListBloc.dart';
import 'package:moviedb_flutter/ui/screen/movielistbloc/MovieListState.dart';
import 'package:moviedb_flutter/ui/widget/PlatformProgress.dart';
import 'package:moviedb_flutter/util/Utils.dart';

import 'MovieListEvent.dart';

void main() {
  // setup dependency injection
  setupDI();

  runApp(BlocApp());
}

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => MovieListBloc(),
          child: MovieList(),
        ),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieListBloc _movieListBloc;
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    _movieListBloc = BlocProvider.of<MovieListBloc>(context);
    _movieListBloc.add(Load());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieListBloc, MovieListState>(
      listener: (context, state) {
        if (state is LoadSuccessState) {
          _refreshCompleter?.complete();
          _refreshCompleter = Completer();
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: PlatformProgress(),
          );
        }

        if (state is LoadErrorState) {
          return Center(
            child: Text(state.message ?? "Failed to load"),
          );
        }

        if (state is LoadSuccessState) {
          return buildList(state.movieList);
        }

        return Container();
      },
    );
  }

  Widget buildList(List<Movie> movieList) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: GridView.builder(
        physics: Platform.isAndroid
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
        itemCount: movieList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index + 5 >= movieList.length) {
            _movieListBloc.add(LoadMore());
          }
          return buildMovieItem(context, movieList[index]);
        },
      ),
    );
  }

  Widget buildMovieItem(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () => openDetailPage(context, movie),
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: CachedNetworkImage(
            imageUrl: getSmallImageUrl(movie.posterPath),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              decoration:
                  BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
              child: Text(
                movie.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    _movieListBloc.add(Refresh());
    return _refreshCompleter.future;
  }

  /// open detail page
  void openDetailPage(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return buildMovieDetailWidget(movie);
      }),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
