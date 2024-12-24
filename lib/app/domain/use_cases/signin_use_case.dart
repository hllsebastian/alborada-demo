import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';

class SigninUseCase {
  SigninUseCase(this.repository);
  final AuthRepository repository;

  Future<AlboradaUser> call(String email, String password) {
    return repository.singinUser(email, password);
  }
}
