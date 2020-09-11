import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';
import 'package:retrofit/retrofit.dart';

part 'ApiClient.g.dart';

const BASE_URL = "https://api.themoviedb.org";
const API_KEY = "api_key";
const API_KEY_VALUE = "2cdf3a5c7cf412421485f89ace91e373";

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 10000,
      connectTimeout: 10000,
      sendTimeout: 10000,
      baseUrl: BASE_URL,
      queryParameters: {
        API_KEY: API_KEY_VALUE,
      },
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('/3/discover/movie')
  Future<MovieListResponse> discoverMovie({
    @required @Queries() Map<String, dynamic> queries,
  });
}
