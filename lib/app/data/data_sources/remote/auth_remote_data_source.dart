import 'dart:convert';

import 'package:alborada_demo/app/core/core.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AlboradaUser> createAccount(String email, String password);
  Future<dynamic> createUser(AlboradaUser user);
  Future<User> loginUser(String email, String password);
  Future<List<Map<String, dynamic>>> getUser(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.client);
  final SupabaseClient client;

  @override
  Future<AlboradaUser> createAccount(String email, String password) async {
    Logger.info('Creating account for email: $email');
    try {
      final response =
          await client.auth.signUp(email: email, password: password);
      if (response.user != null) {
        final userData = AlboradaUser(
          email: email,
          id: response.user!.id,
          // confirmationSentAt: response.user!.confirmationSentAt,
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

  @override
  Future<User> loginUser(String email, String password) async {
    try {
      final response = await client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        final userData = response.user!;
        final formattedData = JsonEncoder.withIndent(' ').convert(userData);
        Logger.info('Status code $response');
        Logger.info('User ${userData.email} succesful login');
        Logger.info(formattedData);
        return userData;
      } else {
        Logger.info('Status code $response');
        // Logger.info(response.session.);
        throw Exception('Incorrect credentials');
      }
    } on AuthApiException catch (e) {
      Logger.error(e.statusCode ?? '');
      Logger.error(e.message);
      rethrow;
    } catch (e) {
      Logger.error('Something went wrong');
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getUser(String email) async {
    try {
      final response = await client.from('a_users').select().eq('email', email);
      // final response = await client.schema('auth').from('users').select('*');
      // final a = await response.ilike('email', email);
      // final userData = response.user!;
      // final formattedData = JsonEncoder.withIndent(' ').convert(userData);
      Logger.info('RESPONSE $response');
      // Logger.info('User ${userData.email} succesful login');
      // Logger.info(formattedData);
      return response;
    } on AuthApiException catch (e) {
      Logger.error(e.statusCode ?? '');
      Logger.error(e.message);
      rethrow;
    } on PostgrestException catch (e) {
      if (e.details == 'Not Found') return [];
      Logger.error(e.details.toString());
      rethrow;
    } catch (e) {
      Logger.error(e.toString());
      rethrow;
    }
  }

  @override
  Future<dynamic> createUser(AlboradaUser user) async {
    try {
      final newUser = user.copyWith(onboardingComplete: true);
      final response = await client.from('a_users').insert([
        {
          'id': newUser.id,
          'email': newUser.email,
          'created_at': newUser.createdAt,
          'onboarding_complete': newUser.onboardingComplete
        }
      ]);
      return response;
    } on AuthApiException catch (e) {
      Logger.error(e.statusCode ?? '');
      Logger.error(e.message);
      rethrow;
    } on PostgrestException catch (e) {
      if (e.details == 'Not Found') return [];
      Logger.error(e.details.toString());
      rethrow;
    } catch (e) {
      Logger.error(e.toString());
      rethrow;
    }
  }
}
