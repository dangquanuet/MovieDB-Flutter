import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';
import 'package:moviedb_flutter/data/model/trailer_model.dart';
import 'package:moviedb_flutter/data/remote/ApiClient.dart';
import 'package:moviedb_flutter/data/remote/ServerError.dart';
import 'package:moviedb_flutter/data/remote/response/BaseModel.dart';
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';

abstract class MovieRepository {
  Future<BaseModel<MovieListResponse>> discoverMovies({@required int page});

  Future<MovieListResponse> discoverMovies2(int page);

  Future<List<Movie>> searchMovies(String query);

  Future<Trailer> getTrailer({@required String movieId});

  Future<Movie> getMovieById(String id);

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

  final Dio dio = Dio();
  final Logger logger = Logger();
  ApiClient apiClient;

  _MovieRepository() {
    apiClient = ApiClient(dio);
  }

  @override
  Future<BaseModel<MovieListResponse>> discoverMovies(
      {@required int page}) async {
    MovieListResponse response;
    try {
      response = await apiClient.discoverMovie(
        queries: {
          PAGE: page,
        },
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  @override
  Future<MovieListResponse> discoverMovies2(int page) async {
    final url = Uri.https(BASE_URL, DISCOVER_MOVIE,
        {API_KEY: MOVIE_API_KEY, PAGE: page.toString()});

    print(url);
    final response = await http.get(url).timeout(Duration(seconds: 10));
    final decoded = json.decode(response.body);
    print(response.statusCode);
    print(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return MovieListResponse.fromJson(decoded);
        break;

      default:
        throw HttpException(decoded[STATUS_MESSAGE]);
    }
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(
      BASE_URL,
      SEARCH_MOVIE,
      {API_KEY: MOVIE_API_KEY, QUERY: query ?? ''},
    );
    final response = await http.get(url);
    final decoded = json.decode(response.body);

    return response.statusCode == HttpStatus.ok
        ? (decoded[RESULTS] as List)
            .map((json) => Movie.fromJson(json))
            .toList()
        : throw HttpException(decoded[STATUS_MESSAGE]);
  }

  @override
  Future<Trailer> getTrailer({String movieId}) async {
    final response =
        await http.get("$BASE_URL/$movieId/videos?$API_KEY=$MOVIE_API_KEY");
    if (response.statusCode == HttpStatus.ok) {
      return Trailer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final url = Uri.https(
      BASE_URL,
      MOVIE_DETAIL + '$id',
      {API_KEY: MOVIE_API_KEY},
    );
    final response = await http.get(url);
    final decoded = json.decode(response.body);

    return response.statusCode == HttpStatus.ok
        ? Movie.fromJson(decoded)
        : throw HttpException(decoded[STATUS_MESSAGE]);
  }
}
