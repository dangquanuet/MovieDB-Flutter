import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/base/base_load_more_refresh_bloc.dart';

class MovieListBloc extends BaseLoadMoreRefreshBloc<Movie> {
  final _movieRepository = getIt.get<MovieRepository>();

//  Observable<List> get movieList => dataFetcher.stream;

  @override
  void loadData(int page) async {
    final response = await _movieRepository.discoverMovies(page);
    if (response is MovieListResponse) {
      onLoadSuccess(page, response.results);
    } else if (response is Exception) {
      onLoadFail();
    }
  }
}
