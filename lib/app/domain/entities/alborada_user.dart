import 'package:freezed_annotation/freezed_annotation.dart';

part 'alborada_user.freezed.dart';
part 'alborada_user.g.dart';

@freezed
class AlboradaUser with _$AlboradaUser {
  factory AlboradaUser({
    required String id,
    required String email,
    String? name,
    @JsonKey(name: 'last_name') String? lastName,
    String? biography,
    String? interests,
    @JsonKey(name: 'total_points') @Default(0) int totalPoints,
    String? createdAt,
    bool? onboardingComplete,
    String? profileImage,
    // String? country,
    // String? city,
    // String? confirmationSentAt,
    // bool? appFirstLogin,
  }) = _AlboradaUser;

  factory AlboradaUser.empty() => AlboradaUser(
        id: '',
        email: '',
        name: '',
        lastName: '',
        biography: '',
        interests: '',
        totalPoints: 0,
        createdAt: '',
        onboardingComplete: false,
      );

  factory AlboradaUser.fromJson(Map<String, dynamic> json) =>
      _$AlboradaUserFromJson(json);
}
