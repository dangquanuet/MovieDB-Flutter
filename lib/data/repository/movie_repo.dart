import 'dart:async';

import 'package:moviedb_flutter/data/remote/service/api_client.dart';

import '../remote/response/movie_list_response.dart';
import '../remote/service/api_service.dart';

abstract class MovieRepo {
  Future<MovieListResponse> discoverMovies({required int page});

  factory MovieRepo.getInstance() => _MovieRepoImpl();
}

class _MovieRepoImpl implements MovieRepo {
  ApiService apiClient = ApiService(dio: buildDioClient());

  @override
  Future<MovieListResponse> discoverMovies({required int page}) async {
    return apiClient.discoverMovie(page: page);
  }
}
