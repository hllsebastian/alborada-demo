import 'package:alborada_demo/app/data/data_sources/auth_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<AlboradaUser> singinUser(String email, String password) {
    return remoteDataSource.signinUser(email, password);
  }
}
