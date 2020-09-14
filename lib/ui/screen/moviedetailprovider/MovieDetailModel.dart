import 'package:moviedb_flutter/data/repository/MovieRepository.dart';
import 'package:moviedb_flutter/di/ServiceLocator.dart';
import 'package:moviedb_flutter/ui/base/BaseModel.dart';

class MovieDetailModel extends BaseModel {
  final _movieRepository = getIt.get<MovieRepository>();
}
