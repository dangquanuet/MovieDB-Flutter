import 'package:moviedb_flutter/data/remote/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/movie.dart';

part 'movies.g.dart';

@riverpod
class Movies extends _$Movies {
  @override
  Future<List<Movie>> build({required int page}) {
    return ref
        .watch(apiProvider)
        .discoverMovie(page: page)
        .then((value) => value.results);
  }
}
