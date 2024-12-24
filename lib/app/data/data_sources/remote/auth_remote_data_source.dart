import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AlboradaUser> signinUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.client);
  final SupabaseClient client;

  @override
  Future<AlboradaUser> signinUser(String email, String password) async {
    final response = await client.auth.signUp(email: email, password: password);
    if (response.user != null) {
      return AlboradaUser(
        email: email,
        id: response.user!.id,
        name: '',
        lastName: '',
      );
    } else {
      throw Exception('Error registering user');
    }
  }
}
