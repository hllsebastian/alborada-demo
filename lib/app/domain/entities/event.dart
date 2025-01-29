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
    @Default(0) int points,
    DateTime? date,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
