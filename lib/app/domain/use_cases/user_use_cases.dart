import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';

class UserUseCases {
  UserUseCases(this.repo);
  final IUserRepository repo;

  Future<List<Event>> getEvents() {
    return repo.getEvents();
  }
}
