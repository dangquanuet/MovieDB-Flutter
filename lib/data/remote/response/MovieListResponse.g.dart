// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse(
    page: json['page'] as int,
    totalResults: json['totalResults'] as int,
    totalPages: json['totalPages'] as int,
    results: (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
