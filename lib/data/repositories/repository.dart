import 'dart:async';

import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';

import '../models/trailer_model.dart';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieListResponse> fetchAllMovies(int page) =>
      moviesApiProvider.fetchMovieList(page);

  Future<Trailer> fetchTrailers(String movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}
