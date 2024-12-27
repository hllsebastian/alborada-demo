import 'dart:convert';

import 'package:alborada_demo/app/core/core.dart';
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
    Logger.info('Creating account for email: $email');
    try {
      final response =
          await client.auth.signUp(email: email, password: password);
      if (response.user != null) {
        // Logger.info('Registro exitoso para usuario: ${response.user!.email}');
        Logger.info('${response.user}.');

        final userData = AlboradaUser(
          email: email,
          id: response.user!.id,
        );

        final formattedData = JsonEncoder.withIndent(' ').convert(userData);
        Logger.info('Status code $response');
        Logger.info('User ${userData.email} succesful created');
        Logger.info(formattedData);
        return userData;
      } else {
        throw Exception('''The user it can't be created''');
      }
    } catch (e) {
      Logger.error('Error creating user: $e');
      rethrow;
    }
  }
}
