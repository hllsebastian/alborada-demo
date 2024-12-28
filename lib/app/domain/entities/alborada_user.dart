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
    String? profileImage,
    String? country,
    String? city,
    String? biography,
    String? confirmationSentAt,
  }) = _AlboradaUser;

  factory AlboradaUser.fromJson(Map<String, dynamic> json) =>
      _$AlboradaUserFromJson(json);
}
