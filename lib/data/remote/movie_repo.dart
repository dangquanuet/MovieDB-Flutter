import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:moviedb_flutter/data/local/favorite_movie_db.dart';
import 'package:moviedb_flutter/data/model/movie.dart';
import 'package:moviedb_flutter/data/response/MovieListResponse.dart';

abstract class MovieDataSource {
  Future<MovieListResponse> discoverMovies({@required page: int});

  Future<List<Movie>> getMovies({@required String query});

  Future<List<Movie>> getFavoriteMovies();

  Future<bool> isFavorite({@required String id});

  Future<int> removeFavorite({@required String id});

  Future<int> insertFavorite({@required Movie movie});

  Future<Movie> getMovieById({@required String id});

  factory MovieDataSource.getInstance() => _MovieRepository();
}

class _MovieRepository implements MovieDataSource {
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

  static _MovieRepository _instance;
  final FavoriteMovieDb _db;

  factory _MovieRepository() =>
      _instance ??= _MovieRepository._internal(FavoriteMovieDb.getInstance());

  _MovieRepository._internal(this._db);

  @override
  Future<MovieListResponse> discoverMovies({page: int}) async {
    var url = Uri.https(BASE_URL, DISCOVER_MOVIE,
        {API_KEY: MOVIE_API_KEY, PAGE: page.toString()});
    print(url);
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    return response.statusCode == HttpStatus.OK
        ? MovieListResponse.fromJson(decoded)
        : throw HttpException(decoded[STATUS_MESSAGE]);
  }

  @override
  Future<List<Movie>> getMovies({@required String query}) async {
    var url = Uri.https(
      BASE_URL,
      SEARCH_MOVIE,
      {API_KEY: MOVIE_API_KEY, QUERY: query ?? ''},
    );
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    return response.statusCode == HttpStatus.OK
        ? (decoded[RESULTS] as List)
            .map((json) => Movie.fromJson(json))
            .toList()
        : throw HttpException(decoded[STATUS_MESSAGE]);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() => _db.getMovies();

  @override
  Future<bool> isFavorite({String id}) async {
    var movie = await _db.getMovie(id);
    return movie != null;
  }

  @override
  Future<int> removeFavorite({String id}) => _db.delete(id);

  @override
  Future<int> insertFavorite({Movie movie}) => _db.insert(movie);

  @override
  Future<Movie> getMovieById({String id}) async {
    var url = Uri.https(
      BASE_URL,
      MOVIE_DETAIL + '$id',
      {API_KEY: MOVIE_API_KEY},
    );
    var response = await http.get(url);
    var decoded = json.decode(response.body);

    return response.statusCode == HttpStatus.OK
        ? Movie.fromJson(decoded)
        : throw HttpException(decoded[STATUS_MESSAGE]);
  }
}
