import 'package:alborada_demo/app/domain/entities/entities.dart';

abstract class IUserRepository {
  Future<List<Event>> getEvents();
  Future<void> editUserProfile({
    required String userId,
    String? biography,
    List<String>? interests,
    int? totalPoints,
  });
}
