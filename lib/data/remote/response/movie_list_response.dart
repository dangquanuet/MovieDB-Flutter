import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/movie.dart';

part 'movie_list_response.freezed.dart';
part 'movie_list_response.g.dart';

@freezed
class MovieListResponse with _$MovieListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieListResponse({
    required int page,
    required int totalResults,
    required int totalPages,
    required List<Movie> results,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);
}
