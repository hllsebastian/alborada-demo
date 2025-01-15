// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alborada_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlboradaUserImpl _$$AlboradaUserImplFromJson(Map<String, dynamic> json) =>
    _$AlboradaUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      createdAt: json['createdAt'] as String?,
      onboardingComplete: json['onboardingComplete'] as bool?,
    );

Map<String, dynamic> _$$AlboradaUserImplToJson(_$AlboradaUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'lastName': instance.lastName,
      'createdAt': instance.createdAt,
      'onboardingComplete': instance.onboardingComplete,
    };
