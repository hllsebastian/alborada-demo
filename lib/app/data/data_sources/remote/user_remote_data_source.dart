import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<AlboradaUser> getUser(String id);
  Future<List<Event>> getEvents();
  Future<AlboradaUser> updateUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.supaClient);
  final SupabaseClient supaClient;

  @override
  Future<AlboradaUser> getUser(String id) async {
    final response = await supaClient.from('a_users').select().eq('id', id);
    final dataSetted = response.map((json) => AlboradaUser.fromJson(json));
    return dataSetted.first;
  }

  @override
  Future<List<Event>> getEvents() async {
    final response = await supaClient.rest.from('event').select();
    final dataSetted = response.map((json) => Event.fromJson(json)).toList();
    return dataSetted;
  }

  @override
  Future<AlboradaUser> updateUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
  }) async {
    final response = await supaClient
        .from('a_users')
        .update({
          if (biography != null) 'biography': biography,
          if (name != null) 'name': name,
          if (lastName != null) 'last_name': lastName,
        })
        .eq('id', userId)
        .select();
    final dataSetted = response.map((json) => AlboradaUser.fromJson(json));
    print(dataSetted.first);
    return dataSetted.first;
    // TODO: error handling
    // if (response.error != null) {
    //   throw Exception(
    //       'Error updating user profile: ${response.error!.message}');
    // }
  }
}
