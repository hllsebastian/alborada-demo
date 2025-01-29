import 'package:freezed_annotation/freezed_annotation.dart';

part 'alborada_user.freezed.dart';
part 'alborada_user.g.dart';

@freezed
class AlboradaUser with _$AlboradaUser {
  factory AlboradaUser({
    required String id,
    required String email,
    String? name,
    String? lastName,
    String? biography,
    String? interests,
    @Default(0) int? totalPoints,
    String? createdAt,
    bool? onboardingComplete,
    // String? profileImage,
    // String? country,
    // String? city,
    // String? confirmationSentAt,
    // bool? appFirstLogin,
  }) = _AlboradaUser;

  factory AlboradaUser.fromJson(Map<String, dynamic> json) =>
      _$AlboradaUserFromJson(json);
}
