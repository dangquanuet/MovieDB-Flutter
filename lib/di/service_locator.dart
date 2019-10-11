import 'package:get_it/get_it.dart';
import 'package:moviedb_flutter/data/local/LocalStorageService.dart';

final locator = GetIt();

void setupDI() async {
  locator.registerSingleton<LocalStorageService>(
      await LocalStorageService.getInstance());

  print('DI done');
}
