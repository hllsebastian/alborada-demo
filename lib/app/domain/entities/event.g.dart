// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      place: json['place'] as String? ?? '',
      neighborhood: json['neighborhood'] as String? ?? '',
      imageUrl: json['url_image'] as String?,
      howWorks: json['how_works'] as String?,
      urlIcon: json['url_icon'] as String?,
      points: (json['points'] as num?)?.toInt() ?? 0,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'place': instance.place,
      'neighborhood': instance.neighborhood,
      'url_image': instance.imageUrl,
      'how_works': instance.howWorks,
      'url_icon': instance.urlIcon,
      'points': instance.points,
      'date': instance.date?.toIso8601String(),
    };
