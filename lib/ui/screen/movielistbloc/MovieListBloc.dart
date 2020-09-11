import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/data/repository/MovieRepository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/screen/movielistbloc/MovieListState.dart';
import 'package:rxdart/rxdart.dart';

import 'MovieListEvent.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository _movieRepository = getIt.get<MovieRepository>();

  MovieListBloc() : super(LoadingState());

  @override
  Stream<Transition<MovieListEvent, MovieListState>> transformEvents(
      Stream<MovieListEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<MovieListState> mapEventToState(
    MovieListEvent event,
  ) async* {
    final currentState = state;
    int nextPage = 1;
    try {
      List<Movie> movies;
      switch (event.runtimeType) {
        case Load:
          yield LoadingState();
          movies = await _fetchMovies(nextPage);
          break;

        case LoadMore:
          if (currentState is LoadSuccessState) {
            nextPage = currentState.page + 1;
            List<Movie> newMovies = await _fetchMovies(nextPage);
            movies = currentState.movieList + newMovies;
          }
          break;

        case Refresh:
          if (currentState is LoadSuccessState) {
            movies = await _fetchMovies(nextPage);
          }
          break;
      }
      yield LoadSuccessState(movieList: movies, page: nextPage);
    } catch (exception) {
      if (exception is HttpException) {
        yield LoadErrorState(exception.message);
      }
    }
  }

  Future<List<Movie>> _fetchMovies(int page) async {
    final response = await _movieRepository.discoverMovies(page: page);
    return response.data.results;
  }
}
