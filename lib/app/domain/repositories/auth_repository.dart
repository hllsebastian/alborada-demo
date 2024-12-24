import 'package:alborada_demo/app/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<AlboradaUser> singinUser(String email, String password);
}
