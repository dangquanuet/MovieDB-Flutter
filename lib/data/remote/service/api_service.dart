import 'package:dio/dio.dart';
import 'package:moviedb_flutter/data/remote/response/movie_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_client.dart';

part 'api_service.g.dart';

@riverpod
ApiService api(ApiRef ref) {
  final apiService = ApiService(dio: buildDioClient());
  ref.keepAlive();
  return apiService;
}

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio}) {
    return _ApiService(dio);
  }

  @GET('/3/discover/movie')
  Future<MovieListResponse> discoverMovie({@Query("page") required int page});
}
