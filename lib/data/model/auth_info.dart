import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviedb_flutter/data/model/user.dart';

part 'auth_info.freezed.dart';
part 'auth_info.g.dart';

@freezed
class AuthInfo with _$AuthInfo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthInfo({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = _AuthInfo;

  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);
}
