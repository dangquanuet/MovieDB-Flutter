import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Result({
    required String id,
    required String key,
    required String name,
    required String site,
    required int size,
    required String type,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
