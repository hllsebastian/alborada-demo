import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';

class UserUseCases {
  UserUseCases(this.repo);
  final IUserRepository repo;

  Future<List<Event>> getEvents() {
    return repo.getEvents();
  }

  Future<void> editProfileUser({
    required String userId,
    String? biography,
    List<String>? interests,
    int? totalPoints,
  }) {
    return repo.editUserProfile(
      userId: userId,
      biography: biography,
      interests: interests,
      totalPoints: totalPoints,
    );
  }
}
