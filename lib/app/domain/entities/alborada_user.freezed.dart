// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alborada_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlboradaUser _$AlboradaUserFromJson(Map<String, dynamic> json) {
  return _AlboradaUser.fromJson(json);
}

/// @nodoc
mixin _$AlboradaUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get biography => throw _privateConstructorUsedError;
  String? get interests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_points')
  int get totalPoints => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get onboardingComplete => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;

  /// Serializes this AlboradaUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlboradaUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlboradaUserCopyWith<AlboradaUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlboradaUserCopyWith<$Res> {
  factory $AlboradaUserCopyWith(
          AlboradaUser value, $Res Function(AlboradaUser) then) =
      _$AlboradaUserCopyWithImpl<$Res, AlboradaUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      @JsonKey(name: 'last_name') String? lastName,
      String? biography,
      String? interests,
      @JsonKey(name: 'total_points') int totalPoints,
      String? createdAt,
      bool? onboardingComplete,
      String? profileImage});
}

/// @nodoc
class _$AlboradaUserCopyWithImpl<$Res, $Val extends AlboradaUser>
    implements $AlboradaUserCopyWith<$Res> {
  _$AlboradaUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlboradaUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? biography = freezed,
    Object? interests = freezed,
    Object? totalPoints = null,
    Object? createdAt = freezed,
    Object? onboardingComplete = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingComplete: freezed == onboardingComplete
          ? _value.onboardingComplete
          : onboardingComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlboradaUserImplCopyWith<$Res>
    implements $AlboradaUserCopyWith<$Res> {
  factory _$$AlboradaUserImplCopyWith(
          _$AlboradaUserImpl value, $Res Function(_$AlboradaUserImpl) then) =
      __$$AlboradaUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      @JsonKey(name: 'last_name') String? lastName,
      String? biography,
      String? interests,
      @JsonKey(name: 'total_points') int totalPoints,
      String? createdAt,
      bool? onboardingComplete,
      String? profileImage});
}

/// @nodoc
class __$$AlboradaUserImplCopyWithImpl<$Res>
    extends _$AlboradaUserCopyWithImpl<$Res, _$AlboradaUserImpl>
    implements _$$AlboradaUserImplCopyWith<$Res> {
  __$$AlboradaUserImplCopyWithImpl(
      _$AlboradaUserImpl _value, $Res Function(_$AlboradaUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlboradaUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? biography = freezed,
    Object? interests = freezed,
    Object? totalPoints = null,
    Object? createdAt = freezed,
    Object? onboardingComplete = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$AlboradaUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      biography: freezed == biography
          ? _value.biography
          : biography // ignore: cast_nullable_to_non_nullable
              as String?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingComplete: freezed == onboardingComplete
          ? _value.onboardingComplete
          : onboardingComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlboradaUserImpl implements _AlboradaUser {
  _$AlboradaUserImpl(
      {required this.id,
      required this.email,
      this.name,
      @JsonKey(name: 'last_name') this.lastName,
      this.biography,
      this.interests,
      @JsonKey(name: 'total_points') this.totalPoints = 0,
      this.createdAt,
      this.onboardingComplete,
      this.profileImage});

  factory _$AlboradaUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlboradaUserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? biography;
  @override
  final String? interests;
  @override
  @JsonKey(name: 'total_points')
  final int totalPoints;
  @override
  final String? createdAt;
  @override
  final bool? onboardingComplete;
  @override
  final String? profileImage;

  @override
  String toString() {
    return 'AlboradaUser(id: $id, email: $email, name: $name, lastName: $lastName, biography: $biography, interests: $interests, totalPoints: $totalPoints, createdAt: $createdAt, onboardingComplete: $onboardingComplete, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlboradaUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.biography, biography) ||
                other.biography == biography) &&
            (identical(other.interests, interests) ||
                other.interests == interests) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.onboardingComplete, onboardingComplete) ||
                other.onboardingComplete == onboardingComplete) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      lastName,
      biography,
      interests,
      totalPoints,
      createdAt,
      onboardingComplete,
      profileImage);

  /// Create a copy of AlboradaUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlboradaUserImplCopyWith<_$AlboradaUserImpl> get copyWith =>
      __$$AlboradaUserImplCopyWithImpl<_$AlboradaUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlboradaUserImplToJson(
      this,
    );
  }
}

abstract class _AlboradaUser implements AlboradaUser {
  factory _AlboradaUser(
      {required final String id,
      required final String email,
      final String? name,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? biography,
      final String? interests,
      @JsonKey(name: 'total_points') final int totalPoints,
      final String? createdAt,
      final bool? onboardingComplete,
      final String? profileImage}) = _$AlboradaUserImpl;

  factory _AlboradaUser.fromJson(Map<String, dynamic> json) =
      _$AlboradaUserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get biography;
  @override
  String? get interests;
  @override
  @JsonKey(name: 'total_points')
  int get totalPoints;
  @override
  String? get createdAt;
  @override
  bool? get onboardingComplete;
  @override
  String? get profileImage;

  /// Create a copy of AlboradaUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlboradaUserImplCopyWith<_$AlboradaUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
