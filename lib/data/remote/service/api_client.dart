import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const BASE_URL = "https://api.themoviedb.org";
const API_KEY = "api_key";
const API_KEY_VALUE = "2cdf3a5c7cf412421485f89ace91e373";

Dio buildDioClient() {
  final dio = Dio();
  dio.options = BaseOptions(
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 10),
    sendTimeout: Duration(seconds: 10),
    baseUrl: BASE_URL,
    queryParameters: {
      API_KEY: API_KEY_VALUE,
    },
  );
  dio.interceptors.addAll({
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ),
  });
  return dio;
}
