// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      id: json['id'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      size: (json['size'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
    };
