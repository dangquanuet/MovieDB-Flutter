import 'package:moviedb_flutter/data/repository/MovieRepository.dart';
import 'package:moviedb_flutter/di/service_locator.dart';
import 'package:moviedb_flutter/ui/base/base_model.dart';

class MovieDetailModel extends BaseModel {
  final _movieRepository = getIt.get<MovieRepository>();
}
