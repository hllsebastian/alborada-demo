import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<List<Event>> getEvents();
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
}
