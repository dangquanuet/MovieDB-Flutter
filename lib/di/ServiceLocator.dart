import 'package:get_it/get_it.dart';
import 'package:moviedb_flutter/data/repository/MovieRepository.dart';

final getIt = GetIt.instance;

void setupDI() async {
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepository.getInstance());
}
