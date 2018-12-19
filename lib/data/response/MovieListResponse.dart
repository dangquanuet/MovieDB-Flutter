import 'package:moviedb_flutter/data/model/movie.dart';

import 'BaseListResponse.dart';

class MovieListResponse extends BaseListResponse<Movie> {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  MovieListResponse();

  MovieListResponse.fromJson(Map<String, dynamic> map)
      : page = map['page'],
        totalResults = map['total_results'],
        totalPages = map['total_pages'],
        results = (map['results'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();
}
