import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthRepository {
  Future<AlboradaUser> createAccount(String email, String password);
  Future<dynamic> createUser(AlboradaUser user);
  Future<User> loginUser(String email, String password);
  Future<List<Map<String, dynamic>>> getUser(String email);
}
