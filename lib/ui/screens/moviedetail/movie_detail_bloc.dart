import 'package:moviedb_flutter/data/repositories/movie_repository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/base/base_bloc.dart';

class MovieDetailBloc extends BaseBloc {
  final _movieRepository = getIt.get<MovieRepository>();
}
