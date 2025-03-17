// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  @JsonKey(name: 'url_image')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'how_works')
  String? get howWorks => throw _privateConstructorUsedError;
  @JsonKey(name: 'url_icon')
  String? get urlIcon => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String address,
      String place,
      String neighborhood,
      @JsonKey(name: 'url_image') String? imageUrl,
      @JsonKey(name: 'how_works') String? howWorks,
      @JsonKey(name: 'url_icon') String? urlIcon,
      int points,
      DateTime? date});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? address = null,
    Object? place = null,
    Object? neighborhood = null,
    Object? imageUrl = freezed,
    Object? howWorks = freezed,
    Object? urlIcon = freezed,
    Object? points = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      howWorks: freezed == howWorks
          ? _value.howWorks
          : howWorks // ignore: cast_nullable_to_non_nullable
              as String?,
      urlIcon: freezed == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String address,
      String place,
      String neighborhood,
      @JsonKey(name: 'url_image') String? imageUrl,
      @JsonKey(name: 'how_works') String? howWorks,
      @JsonKey(name: 'url_icon') String? urlIcon,
      int points,
      DateTime? date});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? address = null,
    Object? place = null,
    Object? neighborhood = null,
    Object? imageUrl = freezed,
    Object? howWorks = freezed,
    Object? urlIcon = freezed,
    Object? points = null,
    Object? date = freezed,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      howWorks: freezed == howWorks
          ? _value.howWorks
          : howWorks // ignore: cast_nullable_to_non_nullable
              as String?,
      urlIcon: freezed == urlIcon
          ? _value.urlIcon
          : urlIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl implements _Event {
  _$EventImpl(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.address = '',
      this.place = '',
      this.neighborhood = '',
      @JsonKey(name: 'url_image') this.imageUrl,
      @JsonKey(name: 'how_works') this.howWorks,
      @JsonKey(name: 'url_icon') this.urlIcon,
      this.points = 0,
      this.date});

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String place;
  @override
  @JsonKey()
  final String neighborhood;
  @override
  @JsonKey(name: 'url_image')
  final String? imageUrl;
  @override
  @JsonKey(name: 'how_works')
  final String? howWorks;
  @override
  @JsonKey(name: 'url_icon')
  final String? urlIcon;
  @override
  @JsonKey()
  final int points;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'Event(id: $id, name: $name, description: $description, address: $address, place: $place, neighborhood: $neighborhood, imageUrl: $imageUrl, howWorks: $howWorks, urlIcon: $urlIcon, points: $points, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.howWorks, howWorks) ||
                other.howWorks == howWorks) &&
            (identical(other.urlIcon, urlIcon) || other.urlIcon == urlIcon) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, address,
      place, neighborhood, imageUrl, howWorks, urlIcon, points, date);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {final String id,
      final String name,
      final String description,
      final String address,
      final String place,
      final String neighborhood,
      @JsonKey(name: 'url_image') final String? imageUrl,
      @JsonKey(name: 'how_works') final String? howWorks,
      @JsonKey(name: 'url_icon') final String? urlIcon,
      final int points,
      final DateTime? date}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get address;
  @override
  String get place;
  @override
  String get neighborhood;
  @override
  @JsonKey(name: 'url_image')
  String? get imageUrl;
  @override
  @JsonKey(name: 'how_works')
  String? get howWorks;
  @override
  @JsonKey(name: 'url_icon')
  String? get urlIcon;
  @override
  int get points;
  @override
  DateTime? get date;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
