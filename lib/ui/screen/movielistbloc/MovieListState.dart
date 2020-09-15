import 'package:meta/meta.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';

@immutable
abstract class MovieListState {
  const MovieListState();
}

class LoadingState extends MovieListState {}

class LoadSuccessState extends MovieListState {
  final List<Movie> movieList;
  final int page;

  LoadSuccessState({
    @required this.movieList,
    @required this.page,
  });
}

class LoadErrorState extends MovieListState {
  final String message;

  const LoadErrorState(this.message);
}
