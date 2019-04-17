import 'dart:async';
import 'package:moviedb_flutter/data/response/MovieListResponse.dart';

import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieListResponse> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<Trailer> fetchTrailers(String movieId) => moviesApiProvider.fetchTrailer(movieId);
}
