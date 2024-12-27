import 'package:alborada_demo/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<void> singinUser(String email, String password) async {
    try {
      await remoteDataSource.signinUser(email, password);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
