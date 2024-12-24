// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alborada_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlboradaUserImpl _$$AlboradaUserImplFromJson(Map<String, dynamic> json) =>
    _$AlboradaUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      profileImage: json['profileImage'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      biography: json['biography'] as String?,
    );

Map<String, dynamic> _$$AlboradaUserImplToJson(_$AlboradaUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'lastName': instance.lastName,
      'profileImage': instance.profileImage,
      'country': instance.country,
      'city': instance.city,
      'biography': instance.biography,
    };
