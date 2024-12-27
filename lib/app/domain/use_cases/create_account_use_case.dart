import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';

class CreateAccountUseCase {
  CreateAccountUseCase(this.repository);
  final AuthRepository repository;

  Future<void> call(String email, String password) async {
    return repository.singinUser(email, password);
  }
}
