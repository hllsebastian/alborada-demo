import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserUseCases {
  UserUseCases(this.repo);
  final AuthRepository repo;

  Future<AlboradaUser> create(String email, String password) async {
    return repo.createUser(email, password);
  }

  Future<User> login(String email, String password) async {
    return await repo.loginUser(email, password);
  }
}
