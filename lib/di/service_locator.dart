import 'package:get_it/get_it.dart';
import 'package:moviedb_flutter/data/repositories/movie_repository.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepository.getInstance());
}
