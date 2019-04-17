import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:moviedb_flutter/data/remote/response/MovieListResponse.dart';

import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<MovieListResponse> fetchMovieList(int page) async {
    final response =
         await client.get("$_baseUrl/popular?api_key=$_apiKey&page=$page");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieListResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Trailer> fetchTrailer(String movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return Trailer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
