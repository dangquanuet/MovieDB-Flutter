import 'package:dio/dio.dart';
import 'package:moviedb_flutter/data/models/movie.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: 10000,
        connectTimeout: 10000
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('/3/discover/movie')
  Future<List<Movie>> discoverMovie(@Queries() Map<String, dynamic> queries);
}
