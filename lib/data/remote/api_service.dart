import 'package:dio/dio.dart';
import 'package:moviedb_flutter/data/remote/response/movie_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const BASE_URL = "https://api.themoviedb.org";
const API_KEY = "api_key";
const API_KEY_VALUE = "2cdf3a5c7cf412421485f89ace91e373";

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      baseUrl: BASE_URL,
      queryParameters: {
        API_KEY: API_KEY_VALUE,
      },
    );
    return _ApiService(dio);
  }

  @GET('/3/discover/movie')
  Future<MovieListResponse> discoverMovie({@Query("page") required int page});
}
