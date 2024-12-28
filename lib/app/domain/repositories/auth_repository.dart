import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AlboradaUser> createUser(String email, String password);
  Future<User> loginUser(String email, String password);
}
