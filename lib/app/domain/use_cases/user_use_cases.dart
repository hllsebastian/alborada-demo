import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';

class UserUseCases {
  UserUseCases(this.repo);
  final IUserRepository repo;

  Future<AlboradaUser> getUser(String id) {
    return repo.getUser(id);
  }

  Future<List<Event>> getEvents() {
    return repo.getEvents();
  }

  Future<AlboradaUser> editProfileUser(
      {required String userId,
      String? biography,
      String? name,
      String? lastName}) {
    return repo.editUserProfile(
      userId: userId,
      biography: biography,
      name: name,
      lastName: lastName,
    );
  }
}
