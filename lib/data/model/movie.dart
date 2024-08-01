import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Movie(
      {required double popularity,
      required int voteCount,
      required bool video,
      required String posterPath,
      required int id,
      required bool adult,
      required String backdropPath,
      required String originalLanguage,
      required String originalTitle,
      required List<int> genreIds,
      required String title,
      required double voteAverage,
      required String overview,
      required String releaseDate}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
