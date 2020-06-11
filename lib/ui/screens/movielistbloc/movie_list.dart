import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/screens/movielistbloc/bloc.dart';
import 'package:moviedb_flutter/ui/screens/movielistbloc/movie_list_bloc.dart';
import 'package:moviedb_flutter/ui/screens/movielistbloc/movie_list_state.dart';
import 'package:moviedb_flutter/ui/widgets/platform_progress.dart';
import 'package:moviedb_flutter/utils/utils.dart';

void main() {
  // setup dependency injection
  setupDI();

  runApp(BlocApp());
}

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => MovieListBloc()..add(Load()),
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

  @override
  void initState() {
    super.initState();
    _movieListBloc = BlocProvider.of<MovieListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
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
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: movieList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        if (index + 3 >= movieList.length) {
          _movieListBloc.add(LoadMore());
        }
        return buildMovieItem(context, movieList[index]);
      },
    );
  }

  Widget buildMovieItem(BuildContext context, Movie movie) {
    return GestureDetector(
      onTap: () => openDetailPage(context, movie),
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
              child: Image.network(
            getSmallImageUrl(movie.posterPath),
            alignment: Alignment.center,
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

  /// open detail page
  void openDetailPage(BuildContext context, Movie movie) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) {
//        return buildMovieDetailWidget(movie);
//      }),
//    );
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
