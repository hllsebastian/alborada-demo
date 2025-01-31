import 'package:alborada_demo/app/domain/entities/entities.dart';

abstract class IUserRepository {
  Future<AlboradaUser> getUser(String id);
  Future<List<Event>> getEvents();
  Future<AlboradaUser> editUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
  });
}
