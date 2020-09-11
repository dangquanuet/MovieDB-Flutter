import 'package:json_annotation/json_annotation.dart';
import 'package:moviedb_flutter/data/model/Movie.dart';

part 'MovieListResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieListResponse {
  MovieListResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
