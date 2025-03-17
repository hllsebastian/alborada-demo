import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String address,
    @Default('') String place,
    @Default('') String neighborhood,
    @JsonKey(name: 'url_image') String? imageUrl,
    @JsonKey(name: 'how_works') String? howWorks,
    @JsonKey(name: 'url_icon') String? urlIcon,
    @Default(0) int points,
    DateTime? date,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
