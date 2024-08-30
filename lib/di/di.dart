import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:moviedb_flutter/data/repository/movie_repo.dart';

final getIt = GetIt.instance;

void setupDI() async {
  getIt.registerLazySingleton<MovieRepo>(() => MovieRepo.getInstance());
  getIt.registerLazySingleton<Logger>(() => Logger());
}
