import 'package:moviedb_flutter/data/models/movie.dart';

class MovieListResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  MovieListResponse.fromJson(Map<String, dynamic> map)
      : page = map['page'],
        totalResults = map['total_results'],
        totalPages = map['total_pages'],
        results = (map['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
}
