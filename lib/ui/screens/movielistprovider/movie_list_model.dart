import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/base/base_load_more_refresh_model.dart';

class MovieListModel extends BaseLoadMoreRefreshModel<Movie> {

  final _movieRepository = getIt.get<MovieRepository>();

  @override
  void loadData(int page) async {
    _movieRepository
        .discoverMovies(page)
        .then(
          (response) => {
            if (response is MovieListResponse)
              {
                onLoadSuccess(page, response.results),
              }
          },
        )
        .catchError(
          (exception) => {
            if (exception is Exception)
              {
                onLoadFail(exception),
              }
          },
        );
  }
}
