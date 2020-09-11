import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/data/remote/response/BaseModel.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/data/repository/MovieRepository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/base/base_load_more_refresh_model.dart';

class MovieListModel extends BaseLoadMoreRefreshModel<Movie> {
  final _movieRepository = getIt.get<MovieRepository>();

  @override
  void loadData(int page) async {
    _movieRepository
        .discoverMovies(page: page)
        .then(
          (response) => {
            if (response is BaseModel<MovieListResponse>)
              {
                onLoadSuccess(page, response.data.results),
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
