import 'package:alborada_demo/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/i_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<AlboradaUser> createAccount(String email, String password) async {
    try {
      return await remoteDataSource.createAccount(email, password);
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  @override
  Future<User> loginUser(String email, String password) async {
    return await remoteDataSource.loginUser(email, password);
  }

  @override
  Future<List<Map<String, dynamic>>> getUser(String email) async {
    return await remoteDataSource.getUser(email);
  }

  @override
  Future<dynamic> createUser(AlboradaUser user) async {
    return await remoteDataSource.createUser(user);
  }
}
