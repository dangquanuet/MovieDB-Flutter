import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../remote/api_service.dart';
import '../remote/response/movie_list_response.dart';

abstract class MovieRepository {
  Future<MovieListResponse> discoverMovies({required int page});

  factory MovieRepository.getInstance() => _MovieRepository();
}

class _MovieRepository implements MovieRepository {
  static const MOVIE_API_KEY = '2cdf3a5c7cf412421485f89ace91e373';
  static const BASE_URL = 'api.themoviedb.org';
  static const DISCOVER_MOVIE = '/3/discover/movie';
  static const SEARCH_MOVIE = '/3/search/movie';
  static const MOVIE_DETAIL = '/3/movie/';

  static const API_KEY = 'api_key';
  static const QUERY = 'query';
  static const PAGE = "page";
  static const RESULTS = 'results';
  static const STATUS_MESSAGE = 'status_message';

  final Logger logger = Logger();
  ApiService apiClient = ApiService(Dio());

  @override
  Future<MovieListResponse> discoverMovies({required int page}) async {
    return apiClient.discoverMovie(page: page);
  }
}
