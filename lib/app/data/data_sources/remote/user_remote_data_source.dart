import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<List<Event>> getEvents();
  Future<void> updateUserProfile({
    required String userId,
    String? biography,
    List<String>? interests,
    int? totalPoints,
  });
  // Future<List<Event>> getEvents();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.supaClient);
  final SupabaseClient supaClient;

  @override
  Future<List<Event>> getEvents() async {
    final response = await supaClient.rest.from('event').select();
    final dataSetted = response.map((json) => Event.fromJson(json)).toList();
    return dataSetted;
  }

  @override
  Future<void> updateUserProfile({
    required String userId,
    String? biography,
    List<String>? interests,
    int? totalPoints,
  }) async {
    final response = await supaClient.from('a_user').update({
      if (biography != null) 'biography': biography,
      if (interests != null) 'interests': interests,
      if (totalPoints != null) 'totalPoints': totalPoints,
    }).eq('id', userId);
    if (response.error != null) {
      throw Exception(
          'Error updating user profile: ${response.error!.message}');
    }
  }
}
