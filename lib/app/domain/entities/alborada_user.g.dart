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
      lastName: json['last_name'] as String?,
      biography: json['biography'] as String?,
      interests: json['interests'] as String?,
      totalPoints: (json['total_points'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
      onboardingComplete: json['onboardingComplete'] as bool?,
      profileImage: json['profile_image_url'] as String?,
      emailConfirmedAt: json['email_confirmed_at'] as String?,
    );

Map<String, dynamic> _$$AlboradaUserImplToJson(_$AlboradaUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'last_name': instance.lastName,
      'biography': instance.biography,
      'interests': instance.interests,
      'total_points': instance.totalPoints,
      'createdAt': instance.createdAt,
      'onboardingComplete': instance.onboardingComplete,
      'profile_image_url': instance.profileImage,
      'email_confirmed_at': instance.emailConfirmedAt,
    };
