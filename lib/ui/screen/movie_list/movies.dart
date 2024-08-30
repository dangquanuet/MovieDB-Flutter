import 'package:moviedb_flutter/data/remote/service/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/movie.dart';

part 'movies.g.dart';

@riverpod
class Movies extends _$Movies {
  final pageSize = 20;

  @override
  Future<List<Movie>> build() {
    return ref.watch(apiProvider).discoverMovie(page: 1).then((value) {
      return value.results;
    });
  }

  Future<void> loadMore() async {
    final oldItems = await future;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final nextItems = await ref.read(apiProvider).discoverMovie(
              page: (state.value?.length ?? 0) ~/ pageSize + 1,
            );
        return [...oldItems, ...nextItems.results];
      },
    );
  }
}
