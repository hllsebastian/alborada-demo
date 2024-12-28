import 'package:alborada_demo/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<AlboradaUser> createUser(String email, String password) async {
    try {
      return await remoteDataSource.createUser(email, password);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  @override
  Future<User> loginUser(String email, String password) async {
    return await remoteDataSource.loginUser(email, password);
  }
}
