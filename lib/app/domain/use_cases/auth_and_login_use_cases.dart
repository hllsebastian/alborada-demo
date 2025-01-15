import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthAndLoginUseCases {
  AuthAndLoginUseCases(this.repo);
  final IAuthRepository repo;

  Future<AlboradaUser> createAccount(String email, String password) async {
    return repo.createAccount(email, password);
  }

  Future<dynamic> createUser(AlboradaUser user) async {
    return repo.createUser(user);
  }

  Future<User> login(String email, String password) async {
    return await repo.loginUser(email, password);
  }

  Future<List<Map<String, dynamic>>> getUser(String email) async {
    return await repo.getUser(email);
  }
}
