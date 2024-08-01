// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrailerImpl _$$TrailerImplFromJson(Map<String, dynamic> json) =>
    _$TrailerImpl(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrailerImplToJson(_$TrailerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
