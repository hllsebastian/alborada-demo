import 'dart:io';

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

  Future<AlboradaUser> editProfileUser({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
    String? imageUrl,
  }) {
    return repo.editUserProfile(
      userId: userId,
      biography: biography,
      name: name,
      lastName: lastName,
      imageUrl: imageUrl,
    );
  }

  Future<String?> updateUserImage(String userId, File image) {
    return repo.updateUserImage(userId, image);
  }
}
