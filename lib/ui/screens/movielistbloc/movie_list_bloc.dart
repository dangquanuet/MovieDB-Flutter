import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository _movieRepository = getIt.get<MovieRepository>();

  @override
  MovieListState get initialState => LoadingState();

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
      if (event is Load) {
        yield LoadingState();
        movies = await _fetchMovies(nextPage);
      } else if (event is LoadMore) {
        if (currentState is LoadSuccessState) {
          nextPage = currentState.page + 1;
          List<Movie> newMovies = await _fetchMovies(nextPage);
          movies = currentState.movieList + newMovies;
        }
      }
      yield LoadSuccessState(movieList: movies, page: nextPage);
    } catch (exception) {
      if (exception is HttpException) {
        yield LoadErrorState(exception.message);
      }
    }
  }

  Future<List<Movie>> _fetchMovies(int page) async {
    final response = await _movieRepository.discoverMovies(page);
    return response.results;
  }
}
