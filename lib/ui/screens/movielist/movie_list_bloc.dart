import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/data/repositories/repository.dart';
import 'package:moviedb_flutter/ui/base/base_load_more_refresh_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc extends BaseLoadMoreRefreshBloc<MovieListResponse> {
  final _repository = Repository();

  Observable<MovieListResponse> get allMovies => dataFetcher.stream;

  @override
  void loadData(int page) async {
    dataFetcher.sink.add(await _repository.fetchAllMovies(page));
  }
}
