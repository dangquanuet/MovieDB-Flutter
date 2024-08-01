import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviedb_flutter/data/model/result.dart';

part 'trailer.freezed.dart';
part 'trailer.g.dart';

@freezed
class Trailer with _$Trailer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trailer({
    required int id,
    required List<Result> results,
  }) = _Trailer;

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
}
