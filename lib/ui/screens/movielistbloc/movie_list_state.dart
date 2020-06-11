import 'package:meta/meta.dart';
import 'package:moviedb_flutter/data/models/movie.dart';

@immutable
abstract class MovieListState {
  const MovieListState();
}

class LoadingState extends MovieListState {}

class LoadSuccessState extends MovieListState {
  final List<Movie> movieList;
  int page = 1;

  LoadSuccessState({this.movieList, this.page});
}

class LoadErrorState extends MovieListState {
  final String message;

  const LoadErrorState(this.message);
}
