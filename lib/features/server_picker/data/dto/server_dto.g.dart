// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerDto _$ServerDtoFromJson(Map<String, dynamic> json) => _ServerDto(
  id: json['id'] as String,
  name: json['name'] as String,
  country: json['country'] as String,
  latencyMs: (json['latencyMs'] as num).toInt(),
  isMine: json['isMine'] as bool,
  isFavorite: json['isFavorite'] as bool,
  countryCode: json['countryCode'] as String,
);

Map<String, dynamic> _$ServerDtoToJson(_ServerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'latencyMs': instance.latencyMs,
      'isMine': instance.isMine,
      'isFavorite': instance.isFavorite,
      'countryCode': instance.countryCode,
    };
