import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:moviedb_flutter/data/repositories/repository.dart';
import 'package:moviedb_flutter/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc extends BaseBloc<MovieListResponse> {
  final _repository = Repository();

  Observable<MovieListResponse> get allMovies => dataFetcher.stream;

  fetchAllMovies() async {
    dataFetcher.sink.add(await _repository.fetchAllMovies());
  }
}
